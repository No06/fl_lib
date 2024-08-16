import 'package:flutter/material.dart';

enum SwitchDirection {
  previous,
  next,
}

class SwitchIndicator extends StatefulWidget {
  final Widget child;
  final Future<void> Function(SwitchDirection) onSwitchPage;

  const SwitchIndicator({
    super.key,
    required this.child,
    required this.onSwitchPage,
  });

  @override
  State<SwitchIndicator> createState() => _SwitchState();
}

class _SwitchState extends State<SwitchIndicator>
    with TickerProviderStateMixin {
  late final _showIndicatorCtrl = AnimationController(
    vsync: this,
    duration: Durations.medium3,
  );
  late final _showIndicatorAnim = CurvedAnimation(
    parent: _showIndicatorCtrl,
    curve: Curves.fastEaseInToSlowEaseOut,
  );

  SwitchDirection? _scrollDirection;
  bool _isDoingSwitch = false;

  @override
  void dispose() {
    _showIndicatorCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: _handleNotification,
      child: AnimatedBuilder(
        animation: _showIndicatorAnim,
        builder: (_, __) {
          return Stack(
            alignment: AlignmentDirectional.center,
            children: [
              widget.child,
              Positioned(
                child: FadeTransition(
                  opacity: _showIndicatorAnim,
                  child: ScaleTransition(
                    scale: _showIndicatorAnim,
                    child: _buildIndicator(),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildIndicator() {
    final icon = _isDoingSwitch
        ? const SizedBox(
            width: 17,
            height: 17,
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          )
        : switch (_scrollDirection) {
            SwitchDirection.previous => const Icon(
                Icons.arrow_upward,
                size: 17,
              ),
            SwitchDirection.next => const Icon(
                Icons.arrow_downward,
                size: 17,
              ),
            null => const Icon(
                Icons.swipe_vertical,
                size: 17,
              ),
          };
    return ClipOval(
      child: ColoredBox(
        color: const Color.fromARGB(237, 215, 215, 215),
        child: Padding(
          padding: const EdgeInsets.all(7),
          child: icon,
        ),
      ),
    );
  }

  bool _handleNotification(ScrollNotification noti) {
    return switch (noti) {
      final ScrollUpdateNotification update => _handleUpdateNoti(update),
      final ScrollEndNotification end => _handleEndNoti(end),
      final OverscrollNotification over => _handleOverScrollNoti(over),
      _ => false,
    };
  }

  bool _handleUpdateNoti(ScrollUpdateNotification noti) {
    if (noti.dragDetails == null) {
      _scrollDirection = null;
      _showIndicatorCtrl.reverse();
      return false;
    }
    final scrollTop = noti.metrics.extentAfter == 0.0;
    final scrollBottom = noti.metrics.extentBefore == 0.0;
    final scrollDirection = scrollBottom
        ? SwitchDirection.previous
        : scrollTop
            ? SwitchDirection.next
            : null;
    if (_scrollDirection != null && scrollDirection != _scrollDirection) {
      _scrollDirection = null;
      return false;
    }
    if (_scrollDirection == null) {
      _scrollDirection = scrollDirection;
    } else {
      return false;
    }
    if (scrollBottom || scrollTop) {
      _doSwitchPage();
    } else {
      _showIndicatorCtrl.reverse();
    }
    return false;
  }

  bool _handleEndNoti(ScrollEndNotification notification) {
    _showIndicatorCtrl.reverse();
    _scrollDirection = null;
    return false;
  }

  bool _handleOverScrollNoti(OverscrollNotification noti) {
    if (_scrollDirection != null) return false;
    if (noti.dragDetails == null) return false;
    final scrollTop = noti.overscroll < -0.2;
    final scrollBottom = noti.overscroll > 0.2;
    _scrollDirection = scrollBottom
        ? SwitchDirection.next
        : scrollTop
            ? SwitchDirection.previous
            : null;
    if (scrollBottom || scrollTop) {
      _doSwitchPage();
    } else {
      _showIndicatorCtrl.reverse();
    }
    return false;
  }

  void _doSwitchPage() async {
    await _showIndicatorCtrl.forward();
    if (_scrollDirection == null) return;
    setState(() {
      _isDoingSwitch = true;
    });
    await widget.onSwitchPage(_scrollDirection!);
    setState(() {
      _isDoingSwitch = false;
    });
    await _showIndicatorCtrl.reverse();
    _scrollDirection = null;
  }
}
