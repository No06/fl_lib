import 'package:flutter/material.dart';
import 'package:locale_names/locale_names.dart';

extension LocaleX on Locale {
  /// eg: `en` or `en_US`
  String get code {
    if (countryCode == null) {
      return languageCode;
    }
    return '${languageCode}_$countryCode';
  }

  String get nativeName => '$nativeDisplayLanguage ($code)';
}

extension BuildContextLocaleX on BuildContext {
  Locale get locale => Localizations.localeOf(this);

  String get localeNativeName => locale.nativeName;
}

extension String2Locale on String {
  Locale? get toLocale {
    // Issue #151
    if (isEmpty) return null;

    final parts = split('_');
    if (parts.length == 1) {
      return Locale(parts[0]);
    }
    return Locale(parts[0], parts[1]);
  }
}
