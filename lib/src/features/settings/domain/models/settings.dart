import 'package:flutter/material.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

import 'package:shopit/src/core/core.dart';

part 'settings.freezed.dart';
part 'settings.g.dart';

@freezed
@collection
class Settings with _$Settings {
  const factory Settings({
    @Default('1') String id,
    AppLocale? locale,
    @Default(AppTheme()) AppTheme theme,
  }) = _Settings;
}

@embedded
class AppLocale {
  late String languageCode;
  String? countryCode;
}

@freezed
@Embedded(ignore: {'copyWith'})
class AppTheme with _$AppTheme {
  const factory AppTheme({
    @Default(ThemeSeed.blue) ThemeSeed seed,
    @Default(Brightness.light) Brightness brightness,
  }) = _AppTheme;
}

extension AppLocaleExtension on AppLocale {
  Locale toLocale() {
    return Locale(languageCode, countryCode);
  }
}

extension LocaleExtension on Locale {
  AppLocale toAppLocale() {
    return AppLocale()
      ..languageCode = languageCode
      ..countryCode = countryCode;
  }
}
