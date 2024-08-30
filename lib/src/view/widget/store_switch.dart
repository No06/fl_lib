import 'dart:async';

import 'package:fl_lib/fl_lib.dart';
import 'package:flutter/material.dart';

class StoreSwitch extends StatelessWidget {
  final StorePropertyBase<bool> prop;

  /// Exec before make change, after validator.
  final FutureOr<void> Function(bool)? callback;

  /// If return false, the switch will not change.
  final bool Function(bool)? validator;

  const StoreSwitch({
    super.key,
    required this.prop,
    this.callback,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final isBusy = false.vn;
    // Only show [FadeIn] when previous state is busy.
    var lastIsBusy = false;

    return ValBuilder(
      listenable: isBusy,
      builder: (busy) {
        return ValBuilder(
          listenable: prop.listenable(),
          builder: (value) {
            if (busy) {
              lastIsBusy = true;
              return SizedLoading.medium.paddingOnly(right: 17);
            }

            final switcher = Switch(
              value: value,
              onChanged: (value) async {
                if (validator?.call(value) == false) return;
                isBusy.value = true;
                await callback?.call(value);
                isBusy.value = false;
                prop.put(value);
              },
            );

            if (lastIsBusy) {
              final ret = FadeIn(child: switcher);
              lastIsBusy = false;
              return ret;
            }

            return switcher;
          },
        );
      },
    );
  }
}
