import 'package:choice/choice.dart';
import 'package:fl_lib/fl_lib.dart';
import 'package:fl_lib/src/res/l10n.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

const _kTagBtnHeight = 45.0;

class TagSwitcher extends StatelessWidget implements PreferredSizeWidget {
  final ValueNotifier<Set<String>> tags;
  final void Function(String) onTagChanged;
  final String initTag;

  const TagSwitcher({
    super.key,
    required this.tags,
    required this.onTagChanged,
    this.initTag = '',
  });

  @override
  Widget build(BuildContext context) {
    final choice = tags.listenVal(
      (vals) {
        if (vals.isEmpty) return UIs.placeholder;
        final items = <String>['', ...vals];
        return Choice<String>(
          multiple: false,
          clearable: false,
          value: [initTag],
          builder: (state, _) {
            return Wrap(
              children: List<Widget>.generate(
                items.length,
                (index) {
                  final item = items[index];
                  return ChoiceChipX<String>(
                    outPadding:
                        EdgeInsets.only(right: 5, top: isDesktop ? 7 : 0),
                    padding: const EdgeInsets.only(
                        left: 10, right: 13, bottom: 6, top: 6),
                    labelPadding: EdgeInsets.zero,
                    showCheckmark: true,
                    label: item.isEmpty ? libL10n.all : '$item ',
                    state: state,
                    value: item,
                    onSelected: (val, _) => onTagChanged(val),
                  );
                },
              ),
            );
          },
        );
      },
    );
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 13),
      scrollDirection: Axis.horizontal,
      child: choice,
    ).paddingOnly(bottom: 5);
  }

  @override
  Size get preferredSize => const Size.fromHeight(_kTagBtnHeight);
}

final class TagTile extends StatelessWidget {
  final Set<String> allTags;
  final ValueNotifier<Set<String>> tags;

  const TagTile({super.key, required this.tags, required this.allTags});

  @override
  Widget build(BuildContext context) {
    return tags.listenVal(
      (vals) {
        return ListTile(
          leading: const Icon(MingCute.hashtag_line),
          title: Text(l10n.tag),
          subtitle:
              vals.isEmpty ? null : Text(vals.join(', '), style: UIs.textGrey),
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () async {
            final allTags_ = (allTags..addAll(vals)).toList();
            final res = await context.showPickDialog(
              items: allTags_.toList(),
              initial: vals.toList(),
              clearable: true,
              actions: [
                TextButton(
                  onPressed: () {
                    context.pop();
                    tags.value = {};
                  },
                  child: Text(l10n.clear),
                ),
                TextButton(
                  onPressed: () async {
                    context.pop();
                    final ctrl = TextEditingController();
                    void onSave() {
                      final s = ctrl.text.trim();
                      if (s.isEmpty) return;
                      tags.value = tags.value..add(s);
                      context.pop();
                    }

                    context.showRoundDialog(
                      title: l10n.add,
                      child: Input(
                        controller: ctrl,
                        type: TextInputType.text,
                        label: l10n.tag,
                        icon: MingCute.hashtag_line,
                        hint: l10n.name,
                        suggestion: true,
                        autoCorrect: true,
                        autoFocus: true,
                        onSubmitted: (_) => onSave(),
                      ),
                      actions: [Btn.ok(onTap: onSave)],
                    );
                  },
                  child: Text(l10n.add),
                ),
              ],
            );

            if (res == null) return;
            tags.value = res.toSet();
          },
        );
      },
    );
  }
}
