import 'package:flutter/material.dart';

extension ContextX on BuildContext {
  void pop<T extends Object?>([T? result]) {
    if (!canPop) return;
    Navigator.of(this).pop<T>(result);
  }

  bool get canPop => Navigator.of(this).canPop();

  ThemeData get theme => Theme.of(this);

  bool get isDark => theme.brightness == Brightness.dark;

  RouteSettings? get route => ModalRoute.of(this)?.settings;

  MediaQueryData get media => MediaQuery.of(this);

  // Use [MediaQuery.sizeOf] for better performance.
  Size get windowSize => MediaQuery.sizeOf(this);

  bool get isWide {
    final size = windowSize;
    return size.width > size.height;
  }

  bool get isRTL => Directionality.of(this) == TextDirection.rtl;
}
