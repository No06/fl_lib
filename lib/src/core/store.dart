import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:fl_lib/fl_lib.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract final class PrefStore {
  static SharedPreferences? _instance;
  static SharedPreferences get instance => _instance!;

  static Future<void> init() async {
    if (_instance != null) return;
    SharedPreferences.setPrefix('');
    _instance = await SharedPreferences.getInstance();
  }

  static T? get<T>(String key, [T? defaultValue]) {
    final val = instance.get(key);
    if (val == null) return defaultValue;
    if (val is! T) {
      debugPrint('SharedPref.get("$key") is: ${val.runtimeType}');
      return defaultValue;
    }
    return val as T;
  }

  static Future<bool> set<T>(String key, T val) {
    return switch (val) {
      final bool val => instance.setBool(key, val),
      final double val => instance.setDouble(key, val),
      final int val => instance.setInt(key, val),
      final String val => instance.setString(key, val),
      final List<String> val => instance.setStringList(key, val),
      _ => () {
          debugPrint('SharedPref.init: "$key" is ${val.runtimeType}');
          return Future.value(false);
        }(),
    };
  }

  static Set<String> keys() {
    return instance.getKeys();
  }

  static Future<bool> remove(String key) {
    return instance.remove(key);
  }

  static Future<bool> clear() {
    return instance.clear();
  }
}

abstract final class SecureStore {
  static HiveAesCipher? cipher;

  static const _hiveKey = 'hive_key';
  static Future<String?> get encryptionKey async {
    final key = PrefStore.get<String>(_hiveKey) ??
        PrefStore.get<String>('flutter.$_hiveKey');
    return key;
  }

  static Future<void> init() async {
    final encryptionKeyString = await encryptionKey;
    if (encryptionKeyString == null) {
      final key = Hive.generateSecureKey();
      await PrefStore.set(_hiveKey, base64UrlEncode(key));
    }
    final key = await encryptionKey;
    if (key == null) {
      throw Exception('Failed to init SecureStore');
    }
    final encryptionKeyUint8List = base64Url.decode(key);
    cipher = HiveAesCipher(encryptionKeyUint8List);
  }
}

class PersistentStore {
  late final Box box;

  final String boxName;

  PersistentStore(this.boxName);

  Future<void> init() async {
    if (SecureStore.cipher == null) await SecureStore.init();

    final path = switch (Pfs.type) {
      /// The default path of Hive is the HOME dir
      Pfs.linux || Pfs.windows => Paths.doc,
      _ => (await getApplicationDocumentsDirectory()).path,
    };

    final enc = await Hive.openBox(
      '${boxName}_enc',
      path: path,
      encryptionCipher: SecureStore.cipher,
    );

    final unencryptedFile = File('${path.joinPath(boxName)}.hive');
    if (await unencryptedFile.exists()) {
      // Do migration
      try {
        final unencrypted = await Hive.openBox(boxName, path: path);
        for (final key in unencrypted.keys) {
          enc.put(key, unencrypted.get(key));
        }
        await unencrypted.close();
        await unencryptedFile.delete();
        debugPrint('Migrated $boxName');
      } catch (e) {
        debugPrint('Failed to migrate $boxName: $e');
      }
    }

    box = enc;
  }

  StoreProperty<T> property<T>(
    String key,
    T defaultValue, {
    bool updateLastModified = true,
  }) {
    return StoreProperty<T>(
      box,
      key,
      defaultValue,
      updateLastModified: updateLastModified,
    );
  }

  StoreListProperty<T> listProperty<T>(
    String key,
    List<T> defaultValue, {
    bool updateLastModified = true,
  }) {
    return StoreListProperty<T>(
      box,
      key,
      defaultValue,
      updateLastModified: updateLastModified,
    );
  }
}

extension BoxX on Box {
  static const _internalPreffix = '_sbi_';

  /// Last modified timestamp
  static const String lastModifiedKey = '${_internalPreffix}lastModified';
  int? get lastModified {
    final val = get(lastModifiedKey);
    if (val == null || val is! int) {
      final time = DateTimeX.timestamp;
      put(lastModifiedKey, time);
      return time;
    }
    return val;
  }

  Future<void> updateLastModified([int? time]) => put(
        lastModifiedKey,
        time ?? DateTimeX.timestamp,
      );

  /// Convert db to json
  Map<String, T> toJson<T>({bool includeInternal = true}) {
    final json = <String, T>{};
    for (final key in keys) {
      if (key is String &&
          key.startsWith(_internalPreffix) &&
          !includeInternal) {
        continue;
      }
      try {
        json[key] = get(key) as T;
      } catch (_) {
        debugPrint('BoxX.toJson("$key") is: ${get(key).runtimeType}');
      }
    }
    return json;
  }
}

abstract class StorePropertyBase<T> {
  ValueListenable<T> listenable();
  T fetch();
  Future<void> put(T value);
  Future<void> delete();
}

class StoreProperty<T> implements StorePropertyBase<T> {
  StoreProperty(
    this._box,
    this._key,
    this.defaultValue, {
    this.updateLastModified = true,
  });

  final Box _box;
  final String _key;
  T defaultValue;
  bool updateLastModified;

  @override
  ValueListenable<T> listenable() {
    return PropertyListenable<T>(_box, _key, defaultValue);
  }

  @override
  T fetch() {
    final stored = _box.get(_key, defaultValue: defaultValue);
    if (stored is! T) {
      debugPrint('StoreProperty("$_key") is: ${stored.runtimeType}');
      return defaultValue;
    }
    return stored;
  }

  @override
  Future<void> put(T value) {
    if (updateLastModified) _box.updateLastModified();
    return _box.put(_key, value);
  }

  @override
  Future<void> delete() {
    return _box.delete(_key);
  }
}

class StoreListProperty<T> implements StorePropertyBase<List<T>> {
  StoreListProperty(
    this._box,
    this._key,
    this.defaultValue, {
    this.updateLastModified = true,
  });

  final Box _box;
  final String _key;
  List<T> defaultValue;
  bool updateLastModified;

  @override
  ValueListenable<List<T>> listenable() {
    return PropertyListenable<List<T>>(_box, _key, defaultValue);
  }

  @override
  List<T> fetch() {
    final val = _box.get(_key, defaultValue: defaultValue)!;
    try {
      if (val is! List) {
        final exception = 'StoreListProperty("$_key") is: ${val.runtimeType}';
        debugPrint(exception);
        throw Exception(exception);
      }
      return List<T>.from(val);
    } catch (_) {
      return defaultValue;
    }
  }

  @override
  Future<void> put(List<T> value) {
    if (updateLastModified) _box.updateLastModified();
    return _box.put(_key, value);
  }

  @override
  Future<void> delete() {
    return _box.delete(_key);
  }
}

class PropertyListenable<T> extends ValueListenable<T> {
  PropertyListenable(this.box, this.key, this.defaultValue);

  final Box box;
  final String key;
  T? defaultValue;

  final List<VoidCallback> _listeners = [];
  StreamSubscription? _subscription;

  @override
  void addListener(VoidCallback listener) {
    _subscription ??= box.watch().listen((event) {
      if (key == event.key) {
        for (var listener in _listeners) {
          listener();
        }
      }
    });

    _listeners.add(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    _listeners.remove(listener);

    if (_listeners.isEmpty) {
      _subscription?.cancel();
      _subscription = null;
    }
  }

  @override
  T get value {
    final val = box.get(key, defaultValue: defaultValue);
    if (val == null || val is! T) {
      return defaultValue!;
    }
    return val;
  }
}
