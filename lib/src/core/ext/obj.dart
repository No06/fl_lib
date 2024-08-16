import 'package:fl_lib/fl_lib.dart';

extension ObjectX<T> on T {
  bool get isBaseType {
    if (this == null) return true;
    return this is String ||
        this is int ||
        this is double ||
        this is bool ||
        this is List ||
        this is Map;
  }

  /// Return null if this is null, otherwise return the result of [f]
  /// 
  /// Bad:
  ///  - `null.nullOr(() => 1)` => `null ?? 1`
  A? nullOr<A>(A Function() f) => this == null ? null : f();

  VNode<T> get vn => VNode<T>(this);
}

/// Nullable ValueNotifier -> nvn
VNode<T?> nvn<T>() => VNode<T?>(null);
