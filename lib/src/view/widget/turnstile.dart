import 'package:cloudflare_turnstile/cloudflare_turnstile.dart';
import 'package:fl_lib/fl_lib.dart';
import 'package:flutter/material.dart';

final class Turnstile extends StatelessWidget {
  static const siteKey = String.fromEnvironment('TURNSTILE_SITE_KEY');
  static const _verifyEndpoint = 'https://api.lpkt.cn/turnstile';

  final void Function(String)? onError;
  final void Function() onSuccess;

  const Turnstile({
    super.key,
    this.onError,
    required this.onSuccess,
  });

  @override
  Widget build(BuildContext context) {
    return CloudFlareTurnstile(
      siteKey: siteKey,
      baseUrl: 'https://lpkt.cn',
      onError: onError,
      onTokenExpired: () {
        onError?.call('Token expired');
      },
      onTokenRecived: onTokenRecived,
    );
  }

  Future<void> onTokenRecived(String token) async {
    final resp = await myDio.post(
      _verifyEndpoint,
      data: {'token': token},
    );
    if (resp.statusCode != 200) {
      return onError?.call('Failed to verify token: $token');
    }
    onSuccess();
  }
}
