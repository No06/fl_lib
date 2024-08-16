import 'package:fl_lib/fl_lib.dart';
import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  final TextEditingController? controller;
  final int maxLines;
  final int? minLines;
  final String? hint;
  final String? label;
  final void Function(String)? onSubmitted;
  final void Function(String)? onChanged;
  final bool obscureText;
  final IconData? icon;
  final TextInputType? type;
  final TextInputAction? action;
  final FocusNode? node;
  final bool autoCorrect;
  final bool suggestion;
  final String? errorText;
  final Widget? suffix;
  final bool autoFocus;
  final void Function(bool)? onViewPwdTap;
  final bool noWrap;
  final InputCounterWidgetBuilder? counterBuilder;
  final void Function()? onTap;
  final void Function(PointerDownEvent)? onTapOutside;
  final EditableTextContextMenuBuilder? contextMenuBuilder;
  final int? maxLength;

  const Input({
    super.key,
    this.controller,
    this.maxLines = 1,
    this.minLines,
    this.hint,
    this.label,
    this.onSubmitted,
    this.onChanged,
    this.obscureText = false,
    this.icon,
    this.type,
    this.action,
    this.node,
    this.autoCorrect = false,
    this.suggestion = true,
    this.errorText,
    this.autoFocus = false,
    this.onViewPwdTap,
    this.noWrap = false,
    this.suffix,
    this.counterBuilder,
    this.onTap,
    this.onTapOutside,
    this.contextMenuBuilder,
    this.maxLength,
  }) : assert(
          !(obscureText && suffix != null),
          'suffix != null && obscureText',
        );

  @override
  State<StatefulWidget> createState() => _InputState();
}

class _InputState extends State<Input> {
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    final suffix = switch (widget.suffix) {
      null => widget.obscureText
          ? IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
                widget.onViewPwdTap?.call(_obscureText);
              },
            )
          : null,
      final val => val,
    };
    final child = TextField(
      controller: widget.controller,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      obscureText: _obscureText,
      decoration: InputDecoration(
        hintText: widget.hint,
        labelText: widget.label,
        errorText: widget.errorText,
        border: InputBorder.none,
        icon:
            widget.icon == null ? null : Icon(widget.icon).paddingOnly(left: 5),
        suffixIcon: suffix,
      ),
      keyboardType: widget.type,
      textInputAction: widget.action,
      focusNode: widget.node,
      autocorrect: widget.autoCorrect,
      enableSuggestions: widget.suggestion,
      autofocus: widget.autoFocus,
      onSubmitted: widget.onSubmitted,
      onChanged: widget.onChanged,
      buildCounter: widget.counterBuilder,
      onTap: widget.onTap,
      onTapOutside: widget.onTapOutside,
      maxLength: widget.maxLength,
      contextMenuBuilder:
          widget.contextMenuBuilder ?? _defaultContextMenuBuilder,
    );
    if (widget.noWrap) return child;
    return CardX(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
        child: child,
      ),
    );
  }

  Widget _defaultContextMenuBuilder(
          BuildContext context, EditableTextState editableTextState) =>
      AdaptiveTextSelectionToolbar.editableText(
        editableTextState: editableTextState,
      );
}
