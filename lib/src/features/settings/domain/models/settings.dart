import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'package:drift/drift.dart';

import 'package:shopit/src/core/core.dart';

class Settings implements Insertable<Settings> {
  const Settings({
    this.locale,
    this.theme = const AppTheme(),
  });

  Settings.fromDb({
    required String? languageCode,
    required String? countryCode,
    required ThemeSeed themeSeed,
    required Brightness themeBrightness,
  })  : locale = languageCode != null
            ? AppLocale(
                languageCode: languageCode,
                countryCode: countryCode,
              )
            : null,
        theme = AppTheme(
          seed: themeSeed,
          brightness: themeBrightness,
        );

  final AppLocale? locale;
  final AppTheme theme;

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return LocalSettingsCompanion(
      id: const Value(1),
      languageCode: Value(locale?.languageCode),
      countryCode: Value(locale?.countryCode),
      themeSeed: Value(theme.seed),
      themeBrightness: Value(theme.brightness),
    ).toColumns(nullToAbsent);
  }

  Settings copyWith({
    ValueGetter<AppLocale?>? locale,
    AppTheme? theme,
  }) {
    return Settings(
      locale: locale != null ? locale() : this.locale,
      theme: theme ?? this.theme,
    );
  }

  @override
  bool operator ==(covariant Settings other) {
    if (identical(this, other)) return true;

    return other.locale == locale && other.theme == theme;
  }

  @override
  int get hashCode => locale.hashCode ^ theme.hashCode;

  @override
  String toString() => 'Settings(locale: $locale, theme: $theme)';
}

class AppLocale {
  const AppLocale({
    required this.languageCode,
    this.countryCode,
  });

  final String languageCode;
  final String? countryCode;

  AppLocale copyWith({
    String? languageCode,
    String? countryCode,
  }) {
    return AppLocale(
      languageCode: languageCode ?? this.languageCode,
      countryCode: countryCode ?? this.countryCode,
    );
  }

  @override
  bool operator ==(covariant AppLocale other) {
    if (identical(this, other)) return true;

    return other.languageCode == languageCode &&
        other.countryCode == countryCode;
  }

  @override
  int get hashCode => languageCode.hashCode ^ countryCode.hashCode;

  @override
  String toString() =>
      'AppLocale(languageCode: $languageCode, countryCode: $countryCode)';
}

class AppTheme {
  const AppTheme({
    this.seed = ThemeSeed.blue,
    this.brightness = Brightness.light,
  });

  final ThemeSeed seed;
  final Brightness brightness;

  AppTheme copyWith({
    ThemeSeed? seed,
    Brightness? brightness,
  }) {
    return AppTheme(
      seed: seed ?? this.seed,
      brightness: brightness ?? this.brightness,
    );
  }

  @override
  bool operator ==(covariant AppTheme other) {
    if (identical(this, other)) return true;

    return other.seed == seed && other.brightness == brightness;
  }

  @override
  int get hashCode => seed.hashCode ^ brightness.hashCode;

  @override
  String toString() => 'AppTheme(seed: $seed, brightness: $brightness)';
}

extension AppLocaleExtension on AppLocale {
  Locale toLocale() {
    return Locale(languageCode, countryCode);
  }
}

extension LocaleExtension on Locale {
  AppLocale toAppLocale() {
    return AppLocale(
      languageCode: languageCode,
      countryCode: countryCode,
    );
  }
}
