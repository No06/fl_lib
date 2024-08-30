import 'package:fl_lib/fl_lib.dart';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supa = Supabase.instance;

abstract final class SupaUtils {
  static const baseUrl = 'https://supa.lpkt.cn';
  static const annoKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.'
      'ewogICJyb2xlIjogImFub24iLAogICJpc3MiOiAic3VwYWJhc2UiLAogICJpYXQiOiAxNzE4NzI2NDAwLAogICJleHAiOiAxODc2NDkyODAwCn0.'
      'FXx4qCETGSLEdJsX1PKyrDg19-4JuvMpiLFcClr4PQ8';

  static Future<void> init() async {
    await Supabase.initialize(
      url: baseUrl,
      anonKey: annoKey,
      debug: BuildMode.isDebug,
    );
  }

  static Future<void> signIn(String usr, String pwd) async {
    if (supa.client.auth.currentUser == null) {
      debugPrint('Signing in with email and password');
      await supa.client.auth.signInWithPassword(password: pwd, email: usr);
    }

    if (supa.client.auth.currentUser != null) {
      supa.client.auth.startAutoRefresh();
    }

    debugPrint('Supa user [$userEmail]');
  }

  static String? get userId => supa.client.auth.currentUser?.id;
  static String? get userEmail => supa.client.auth.currentUser?.email;
  static Session? get session => supa.client.auth.currentSession;
  static String? get accessToken => session?.accessToken;

  static Map<String, String> get authHeaders {
    final map = {'apikey': annoKey};
    if (accessToken != null) {
      map['Authorization'] = 'Bearer $accessToken';
    }
    return map;
  }
}
