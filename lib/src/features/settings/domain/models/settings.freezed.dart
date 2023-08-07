// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Settings {
  int get id => throw _privateConstructorUsedError;
  AppLocale? get locale => throw _privateConstructorUsedError;
  AppTheme get theme => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingsCopyWith<Settings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsCopyWith<$Res> {
  factory $SettingsCopyWith(Settings value, $Res Function(Settings) then) =
      _$SettingsCopyWithImpl<$Res, Settings>;
  @useResult
  $Res call({int id, AppLocale? locale, AppTheme theme});

  $AppThemeCopyWith<$Res> get theme;
}

/// @nodoc
class _$SettingsCopyWithImpl<$Res, $Val extends Settings>
    implements $SettingsCopyWith<$Res> {
  _$SettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? locale = freezed,
    Object? theme = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as AppLocale?,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as AppTheme,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AppThemeCopyWith<$Res> get theme {
    return $AppThemeCopyWith<$Res>(_value.theme, (value) {
      return _then(_value.copyWith(theme: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SettingsCopyWith<$Res> implements $SettingsCopyWith<$Res> {
  factory _$$_SettingsCopyWith(
          _$_Settings value, $Res Function(_$_Settings) then) =
      __$$_SettingsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, AppLocale? locale, AppTheme theme});

  @override
  $AppThemeCopyWith<$Res> get theme;
}

/// @nodoc
class __$$_SettingsCopyWithImpl<$Res>
    extends _$SettingsCopyWithImpl<$Res, _$_Settings>
    implements _$$_SettingsCopyWith<$Res> {
  __$$_SettingsCopyWithImpl(
      _$_Settings _value, $Res Function(_$_Settings) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? locale = freezed,
    Object? theme = null,
  }) {
    return _then(_$_Settings(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as AppLocale?,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as AppTheme,
    ));
  }
}

/// @nodoc

class _$_Settings extends _Settings {
  const _$_Settings({this.id = 1, this.locale, this.theme = const AppTheme()})
      : super._();

  @override
  @JsonKey()
  final int id;
  @override
  final AppLocale? locale;
  @override
  @JsonKey()
  final AppTheme theme;

  @override
  String toString() {
    return 'Settings(id: $id, locale: $locale, theme: $theme)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Settings &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.theme, theme) || other.theme == theme));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, locale, theme);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SettingsCopyWith<_$_Settings> get copyWith =>
      __$$_SettingsCopyWithImpl<_$_Settings>(this, _$identity);
}

abstract class _Settings extends Settings {
  const factory _Settings(
      {final int id,
      final AppLocale? locale,
      final AppTheme theme}) = _$_Settings;
  const _Settings._() : super._();

  @override
  int get id;
  @override
  AppLocale? get locale;
  @override
  AppTheme get theme;
  @override
  @JsonKey(ignore: true)
  _$$_SettingsCopyWith<_$_Settings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AppTheme {
// ignore: invalid_annotation_target
  @enumerated
  ThemeSeed get seed =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @enumerated
  Brightness get brightness => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppThemeCopyWith<AppTheme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppThemeCopyWith<$Res> {
  factory $AppThemeCopyWith(AppTheme value, $Res Function(AppTheme) then) =
      _$AppThemeCopyWithImpl<$Res, AppTheme>;
  @useResult
  $Res call({@enumerated ThemeSeed seed, @enumerated Brightness brightness});
}

/// @nodoc
class _$AppThemeCopyWithImpl<$Res, $Val extends AppTheme>
    implements $AppThemeCopyWith<$Res> {
  _$AppThemeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seed = null,
    Object? brightness = null,
  }) {
    return _then(_value.copyWith(
      seed: null == seed
          ? _value.seed
          : seed // ignore: cast_nullable_to_non_nullable
              as ThemeSeed,
      brightness: null == brightness
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as Brightness,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppThemeCopyWith<$Res> implements $AppThemeCopyWith<$Res> {
  factory _$$_AppThemeCopyWith(
          _$_AppTheme value, $Res Function(_$_AppTheme) then) =
      __$$_AppThemeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@enumerated ThemeSeed seed, @enumerated Brightness brightness});
}

/// @nodoc
class __$$_AppThemeCopyWithImpl<$Res>
    extends _$AppThemeCopyWithImpl<$Res, _$_AppTheme>
    implements _$$_AppThemeCopyWith<$Res> {
  __$$_AppThemeCopyWithImpl(
      _$_AppTheme _value, $Res Function(_$_AppTheme) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seed = null,
    Object? brightness = null,
  }) {
    return _then(_$_AppTheme(
      seed: null == seed
          ? _value.seed
          : seed // ignore: cast_nullable_to_non_nullable
              as ThemeSeed,
      brightness: null == brightness
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as Brightness,
    ));
  }
}

/// @nodoc

class _$_AppTheme implements _AppTheme {
  const _$_AppTheme(
      {@enumerated this.seed = ThemeSeed.blue,
      @enumerated this.brightness = Brightness.light});

// ignore: invalid_annotation_target
  @override
  @JsonKey()
  @enumerated
  final ThemeSeed seed;
// ignore: invalid_annotation_target
  @override
  @JsonKey()
  @enumerated
  final Brightness brightness;

  @override
  String toString() {
    return 'AppTheme(seed: $seed, brightness: $brightness)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppTheme &&
            (identical(other.seed, seed) || other.seed == seed) &&
            (identical(other.brightness, brightness) ||
                other.brightness == brightness));
  }

  @override
  int get hashCode => Object.hash(runtimeType, seed, brightness);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppThemeCopyWith<_$_AppTheme> get copyWith =>
      __$$_AppThemeCopyWithImpl<_$_AppTheme>(this, _$identity);
}

abstract class _AppTheme implements AppTheme {
  const factory _AppTheme(
      {@enumerated final ThemeSeed seed,
      @enumerated final Brightness brightness}) = _$_AppTheme;

  @override // ignore: invalid_annotation_target
  @enumerated
  ThemeSeed get seed;
  @override // ignore: invalid_annotation_target
  @enumerated
  Brightness get brightness;
  @override
  @JsonKey(ignore: true)
  _$$_AppThemeCopyWith<_$_AppTheme> get copyWith =>
      throw _privateConstructorUsedError;
}
