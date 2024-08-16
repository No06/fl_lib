import 'package:choice/choice.dart';
import 'package:fl_lib/fl_lib.dart';
import 'package:flutter/material.dart';

class ChoiceChipX<T> extends StatelessWidget {
  const ChoiceChipX({
    super.key,
    required this.label,
    required this.state,
    required this.value,
    this.onSelected,
    this.outPadding,
    this.padding = const EdgeInsets.symmetric(horizontal: 9, vertical: 8),
    this.labelPadding = const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
    this.showCheckmark = true,
  });

  final String label;
  final ChoiceController<T> state;
  final T value;
  final void Function(T, bool)? onSelected;
  final EdgeInsetsGeometry? outPadding;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry labelPadding;
  final bool showCheckmark;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: outPadding ??
          EdgeInsets.only(left: 5, right: 5, top: isDesktop ? 7 : 0),
      child: ChoiceChip(
        label: Text(label),
        side: BorderSide.none,
        showCheckmark: showCheckmark,
        selectedColor: const Color.fromARGB(46, 68, 68, 68),
        backgroundColor: const Color.fromARGB(16, 42, 42, 42),
        padding: padding,
        labelPadding: labelPadding,
        selected: state.selected(value),
        onSelected: (val) {
          state.onSelected(value);
          onSelected?.call(value, val);
        },
      ),
    );
  }
}
