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
    this.color,
  });

  final String label;
  final ChoiceController<T> state;
  final T value;
  final void Function(T, bool)? onSelected;
  final EdgeInsetsGeometry? outPadding;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry labelPadding;
  final bool showCheckmark;
  final WidgetStateProperty<Color>? color;

  @override
  Widget build(BuildContext context) {
    final outPadding = this.outPadding ??
        EdgeInsets.only(left: 5, right: 5, top: isDesktop ? 7 : 0);
    return Padding(
      padding: outPadding,
      child: ChoiceChip(
        label: Text(label),
        side: BorderSide.none,
        showCheckmark: showCheckmark,
        padding: padding,
        labelPadding: labelPadding,
        color: color,
        selected: state.selected(value),
        elevation: 0,
        pressElevation: 0,
        onSelected: (val) {
          state.onSelected(value)(val);
          onSelected?.call(value, val);
        },
      ),
    );
  }
}

final class ChoiceChipColor extends WidgetStateProperty<Color> {
  final BuildContext context;

  ChoiceChipColor(this.context);

  @override
  Color resolve(Set<WidgetState> states) {
    final isSelected = states.contains(WidgetState.selected);
    final color = context.theme.cardTheme.color;
    if (isSelected) {
      return color?.withAlpha(30) ?? const Color.fromARGB(8, 22, 22, 22);
    }
    return color ?? const Color.fromARGB(16, 10, 10, 10);
  }
}
