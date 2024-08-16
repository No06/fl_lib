import 'package:fl_lib/src/core/ext/obj.dart';
import 'package:fl_lib/src/model/rnode.dart';
import 'package:flutter/material.dart';

class Hover extends StatefulWidget {
  final Widget Function(bool hover) builder;

  const Hover({super.key, required this.builder});

  @override
  State<Hover> createState() => _HoverState();
}

class _HoverState extends State<Hover> {
  final _hover = false.vn;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _hover.value = true,
      onExit: (_) => _hover.value = false,
      child: _hover.listenVal(widget.builder),
    );
  }
}
