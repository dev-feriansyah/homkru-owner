import 'package:flutter/material.dart';
import 'package:homekru_owner/core/l10n/generated/app_localizations.dart';

extension LocalizationExtension on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}

extension LocaleExtension on BuildContext {
  bool get isEnglish => Localizations.localeOf(this).languageCode == 'en';
  bool get isIndonesian => Localizations.localeOf(this).languageCode == 'id';
}
