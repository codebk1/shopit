import 'package:flutter/material.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

import 'package:shopit/src/core/core.dart';

part 'settings.freezed.dart';
part 'settings.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Settings with _$Settings {
  const Settings._();

  const factory Settings({
    @Default(1) Id id,
    AppLocale? locale,
    @Default(AppTheme()) AppTheme theme,
  }) = _Settings;

  @override
  Id get id => Isar.autoIncrement;
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
    // ignore: invalid_annotation_target
    @Default(ThemeSeed.blue) @enumerated ThemeSeed seed,
    // ignore: invalid_annotation_target
    @Default(Brightness.light) @enumerated Brightness brightness,
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
