import 'dart:async';

import 'package:fl_lib/fl_lib.dart';
import 'package:fl_lib/src/res/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icons_plus/icons_plus.dart';

final class BioAuthPageArgs {
  final bool autoReqAuth;
  final void Function()? onAuthSuccess;

  const BioAuthPageArgs({
    this.autoReqAuth = true,
    this.onAuthSuccess,
  });
}

final class BioAuthPage extends StatefulWidget {
  final BioAuthPageArgs args;

  const BioAuthPage({super.key, this.args = const BioAuthPageArgs()});

  static const route = AppRoute<bool, BioAuthPageArgs>(
    page: BioAuthPage.new,
    path: '/bio_auth',
  );

  @override
  State<BioAuthPage> createState() => _BioAuthPageState();
}

final class _BioAuthPageState extends State<BioAuthPage> with AfterLayoutMixin {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) SystemNavigator.pop();
      },
      child: Scaffold(
        body: InkWell(
          onTap: _reqAuth,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(IonIcons.finger_print, size: 77),
                UIs.height13,
                Text(l10n.tapToAuth),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _reqAuth() async {
    switch (await BioAuth.goWithResult()) {
      case AuthResult.success:
        context.pop();
        widget.args.onAuthSuccess?.call();
        break;
      default:
    }
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    if (widget.args.autoReqAuth != false) {
      _reqAuth();
    }
  }
}
