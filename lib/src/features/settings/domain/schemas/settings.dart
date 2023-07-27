import 'package:flutter/widgets.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'settings.freezed.dart';
part 'settings.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Settings with _$Settings {
  const Settings._();

  const factory Settings({
    Id? id,
    AppLocale? locale,
  }) = _Settings;

  @override
  Id? get id => Isar.autoIncrement;
}

@embedded
class AppLocale {
  late String languageCode;
  String? countryCode;
}

extension AppLocaleToLocale on AppLocale {
  Locale toLocale() {
    return Locale(languageCode, countryCode);
  }
}

extension LocaleToAppLocale on Locale {
  AppLocale toAppLocale() {
    return AppLocale()
      ..languageCode = languageCode
      ..countryCode = countryCode;
  }
}
