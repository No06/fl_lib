import 'package:fl_lib/src/core/ext/ctx/dialog.dart';
import 'package:fl_lib/src/res/l10n.dart';
import 'package:fl_lib/src/res/ui.dart';
import 'package:fl_lib/src/view/widget/btn/btn.dart';
import 'package:flutter/material.dart';

final class TipText extends StatelessWidget {
  final String text;
  final String tip;
  final bool isMarkdown;
  final TextStyle? textStyle;
  final double reversedWidth;

  const TipText(
    this.text,
    this.tip, {
    super.key,
    this.isMarkdown = false,
    this.textStyle,
    this.reversedWidth = 0,
  });

  @override
  Widget build(BuildContext context) {
    final textWidget = Text(
      text,
      style: textStyle,
    );

    return LayoutBuilder(
      builder: (context, cons) {
        final width = cons.maxWidth;
        final row = Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            textWidget,
            UIs.width13,
            InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                context.showRoundDialog(
                  title: l10n.note,
                  child: Text(tip),
                  actions: Btnx.oks,
                );
              },
              child: const Icon(
                Icons.help_outline,
                size: 17,
                color: Colors.grey,
              ),
            ),
          ],
        );
        final wrapped = switch (width) {
          final double w when w > reversedWidth => SizedBox(
              width: width - reversedWidth,
              child: row,
            ),
          _ => row,
        };
        return wrapped;
      },
    );
  }
}

final class CenterGreyTitle extends StatelessWidget {
  final String text;

  const CenterGreyTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 23, bottom: 17),
      child: Center(
        child: Text(text, style: UIs.textGrey),
      ),
    );
  }
}
