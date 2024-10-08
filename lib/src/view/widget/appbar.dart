import 'dart:io';

import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// System status bar height
  static double? barHeight;

  /// Draw title bar inside Flutter
  static bool drawTitlebar = false;

  const CustomAppBar({
    super.key,
    this.title,
    this.actions,
    this.centerTitle = true,
    this.leading,
    this.backgroundColor,
  });

  final Widget? title;
  final List<Widget>? actions;
  final bool? centerTitle;
  final Widget? leading;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final bar = AppBar(
      key: key,
      title: title,
      actions: actions,
      centerTitle: centerTitle,
      leading: leading,
      backgroundColor: backgroundColor,
      toolbarHeight: (barHeight ?? 0) + kToolbarHeight,
    );
    if (!drawTitlebar) return bar;
    return GestureDetector(
      onVerticalDragStart: (_) {
        windowManager.startDragging();
      },
      onHorizontalDragStart: (_) {
        windowManager.startDragging();
      },
      child: Stack(
        children: [
          bar,
          Positioned(
            right: 0,
            top: 0,
            child: GestureDetector(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    icon: Transform.translate(
                      offset: const Offset(0, -3.5),
                      child: const Icon(Icons.minimize, size: 13),
                    ),
                    onPressed: () => windowManager.minimize(),
                  ),
                  IconButton(
                    icon: const Icon(Icons.crop_square, size: 13),
                    onPressed: () async {
                      if (await windowManager.isMaximized()) {
                        windowManager.unmaximize();
                      } else {
                        windowManager.maximize();
                      }
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, size: 14),
                    onPressed: () => windowManager.close(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Future<void> updateTitlebarHeight() async {
    switch (Platform.operatingSystem) {
      case 'macos':
        barHeight = 27;
        // macos title bar is drawn by system, [drawTitlebar] is not needed.
        break;
      case 'linux' || 'windows':
        barHeight = 37;
        drawTitlebar = true;
        break;
      default:
        break;
    }
  }

  @override
  Size get preferredSize {
    const height = kToolbarHeight - 13;
    if (barHeight == null) return const Size.fromHeight(height);
    return Size.fromHeight(barHeight! + height);
  }
}
