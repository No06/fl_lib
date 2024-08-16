import 'dart:async';

import 'package:fl_lib/fl_lib.dart';
import 'package:flutter/foundation.dart';

import 'package:icloud_storage/icloud_storage.dart';
import 'package:webdav_client/webdav_client.dart';

part 'webdav.dart';
part 'icloud.dart';
part 'iface.dart';

/// Impl this interface to provide a backup service.
abstract class SyncCfg<T extends Mergeable> {
  const SyncCfg();

  /// Load backup from file
  Future<Mergeable> fromFile(String path);

  /// Save backup to file
  Future<void> saveToFile();

  /// {@macro remote_storage}
  Future<RemoteStorage?> get remoteStorage;

  /// Backup data to remote storage.
  Future<void> backup([RemoteStorage? rs]) async {
    rs ??= await remoteStorage;
    if (rs == null) return;

    await saveToFile();
    await rs.upload(relativePath: Paths.bakName);
  }

  /// Sync data with remote storage.
  Future<void> sync({bool throttle = true, RemoteStorage? rs}) async {
    if (!throttle) return await _sync(rs);
    Funcs.throttle(
      () => _sync(rs),
      id: 'SyncCfg.sync',

      /// In common case, a chat will be ended in 10 seconds.
      duration: 10000,
    );
  }

  Future<void> _sync([RemoteStorage? rs]) async {
    rs ??= await remoteStorage;
    if (rs == null) return;

    try {
      await rs.download(relativePath: Paths.bakName);
    } catch (_) {
      return await backup();
    }

    try {
      final dlBak = await compute(fromFile, Paths.bak);
      await dlBak.merge();
    } catch (e, s) {
      Loggers.app.warning('Sync iCloud backup', e, s);
    }

    await Future.delayed(const Duration(milliseconds: 37));
    await backup();
  }
}
