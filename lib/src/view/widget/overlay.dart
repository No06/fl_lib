import 'dart:ui';

import 'package:fl_lib/src/core/ext/obj.dart';
import 'package:fl_lib/src/view/widget/val_builder.dart';
import 'package:flutter/material.dart';

class BlurOverlay extends StatefulWidget {
  final Widget child;
  final Widget popup;

  const BlurOverlay({
    super.key,
    required this.child,
    required this.popup,
  });

  static void Function()? close;

  @override
  State<BlurOverlay> createState() => _BlurOverlayState();
}

class _BlurOverlayState extends State<BlurOverlay>
    with SingleTickerProviderStateMixin {
  OverlayEntry? _overlayEntry;

  /// Can't use `late` because it's not initialized in [dispose]
  ///
  /// The animation controller is created when the overlay is shown.
  AnimationController? _animeCtrl;
  Animation<double>? _blurAnime;
  Animation<double>? _fadeAnime;

  final _isShowingOverlay = false.vn;

  @override
  void dispose() {
    _animeCtrl?.dispose();
    super.dispose();
    BlurOverlay.close = null;
  }

  void _showOverlay(BuildContext context) async {
    /// Set it here, so [BlurOverlay.close] must point to this function owned by
    /// this instance.
    BlurOverlay.close = _removeOverlay;

    final overlayState = Overlay.of(context);

    /// Only create once (`??=`)
    _animeCtrl ??= AnimationController(
      vsync: this,
      duration: Durations.medium1,
    );
    _blurAnime = Tween(begin: 0.0, end: 5.0).animate(
      CurvedAnimation(parent: _animeCtrl!, curve: Curves.easeInOutCubic),
    );

    _fadeAnime = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animeCtrl!, curve: Curves.easeInOutCubic),
    );

    _overlayEntry = _createOverlayEntry(context);
    overlayState.insert(_overlayEntry!);

    await _animeCtrl?.forward();
    _isShowingOverlay.value = true;
  }

  void _removeOverlay() async {
    await _animeCtrl!.reverse();
    _overlayEntry!.remove();
    _overlayEntry = null;
    _isShowingOverlay.value = false;
  }

  OverlayEntry _createOverlayEntry(BuildContext context) {
    return OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: _removeOverlay,
        behavior: HitTestBehavior.opaque,
        child: AnimatedBuilder(
          animation: _animeCtrl!,
          builder: (_, __) {
            return BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: _blurAnime!.value,
                sigmaY: _blurAnime!.value,
              ),
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 11),
                child: FadeTransition(
                  opacity: _fadeAnime!,
                  child: Center(
                    child: widget.popup,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValBuilder(
      listenable: _isShowingOverlay,
      builder: (isShowing) {
        return PopScope(
          canPop: !isShowing,
          onPopInvokedWithResult: (didPop, _) {
            if (_overlayEntry == null) return;
            _removeOverlay();
          },
          child: InkWell(
            borderRadius: BorderRadius.circular(7),
            onLongPress: () => _showOverlay(context),
            child: widget.child,
          ),
        );
      },
    );
  }
}
