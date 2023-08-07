// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSettingsCollection on Isar {
  IsarCollection<Settings> get settings => this.collection();
}

const SettingsSchema = CollectionSchema(
  name: r'Settings',
  id: -8656046621518759136,
  properties: {
    r'locale': PropertySchema(
      id: 0,
      name: r'locale',
      type: IsarType.object,
      target: r'AppLocale',
    ),
    r'theme': PropertySchema(
      id: 1,
      name: r'theme',
      type: IsarType.object,
      target: r'AppTheme',
    )
  },
  estimateSize: _settingsEstimateSize,
  serialize: _settingsSerialize,
  deserialize: _settingsDeserialize,
  deserializeProp: _settingsDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'AppLocale': AppLocaleSchema, r'AppTheme': AppThemeSchema},
  getId: _settingsGetId,
  getLinks: _settingsGetLinks,
  attach: _settingsAttach,
  version: '3.1.0',
);

int _settingsEstimateSize(
  Settings object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.locale;
    if (value != null) {
      bytesCount += 3 +
          AppLocaleSchema.estimateSize(
              value, allOffsets[AppLocale]!, allOffsets);
    }
  }
  bytesCount += 3 +
      AppThemeSchema.estimateSize(
          object.theme, allOffsets[AppTheme]!, allOffsets);
  return bytesCount;
}

void _settingsSerialize(
  Settings object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<AppLocale>(
    offsets[0],
    allOffsets,
    AppLocaleSchema.serialize,
    object.locale,
  );
  writer.writeObject<AppTheme>(
    offsets[1],
    allOffsets,
    AppThemeSchema.serialize,
    object.theme,
  );
}

Settings _settingsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Settings(
    id: id,
    locale: reader.readObjectOrNull<AppLocale>(
      offsets[0],
      AppLocaleSchema.deserialize,
      allOffsets,
    ),
    theme: reader.readObjectOrNull<AppTheme>(
          offsets[1],
          AppThemeSchema.deserialize,
          allOffsets,
        ) ??
        AppTheme(),
  );
  return object;
}

P _settingsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<AppLocale>(
        offset,
        AppLocaleSchema.deserialize,
        allOffsets,
      )) as P;
    case 1:
      return (reader.readObjectOrNull<AppTheme>(
            offset,
            AppThemeSchema.deserialize,
            allOffsets,
          ) ??
          AppTheme()) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _settingsGetId(Settings object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _settingsGetLinks(Settings object) {
  return [];
}

void _settingsAttach(IsarCollection<dynamic> col, Id id, Settings object) {}

extension SettingsQueryWhereSort on QueryBuilder<Settings, Settings, QWhere> {
  QueryBuilder<Settings, Settings, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SettingsQueryWhere on QueryBuilder<Settings, Settings, QWhereClause> {
  QueryBuilder<Settings, Settings, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Settings, Settings, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SettingsQueryFilter
    on QueryBuilder<Settings, Settings, QFilterCondition> {
  QueryBuilder<Settings, Settings, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> localeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'locale',
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> localeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'locale',
      ));
    });
  }
}

extension SettingsQueryObject
    on QueryBuilder<Settings, Settings, QFilterCondition> {
  QueryBuilder<Settings, Settings, QAfterFilterCondition> locale(
      FilterQuery<AppLocale> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'locale');
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> theme(
      FilterQuery<AppTheme> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'theme');
    });
  }
}

extension SettingsQueryLinks
    on QueryBuilder<Settings, Settings, QFilterCondition> {}

extension SettingsQuerySortBy on QueryBuilder<Settings, Settings, QSortBy> {}

extension SettingsQuerySortThenBy
    on QueryBuilder<Settings, Settings, QSortThenBy> {
  QueryBuilder<Settings, Settings, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension SettingsQueryWhereDistinct
    on QueryBuilder<Settings, Settings, QDistinct> {}

extension SettingsQueryProperty
    on QueryBuilder<Settings, Settings, QQueryProperty> {
  QueryBuilder<Settings, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Settings, AppLocale?, QQueryOperations> localeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'locale');
    });
  }

  QueryBuilder<Settings, AppTheme, QQueryOperations> themeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'theme');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const AppLocaleSchema = Schema(
  name: r'AppLocale',
  id: 5834876845497250954,
  properties: {
    r'countryCode': PropertySchema(
      id: 0,
      name: r'countryCode',
      type: IsarType.string,
    ),
    r'languageCode': PropertySchema(
      id: 1,
      name: r'languageCode',
      type: IsarType.string,
    )
  },
  estimateSize: _appLocaleEstimateSize,
  serialize: _appLocaleSerialize,
  deserialize: _appLocaleDeserialize,
  deserializeProp: _appLocaleDeserializeProp,
);

int _appLocaleEstimateSize(
  AppLocale object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.countryCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.languageCode.length * 3;
  return bytesCount;
}

void _appLocaleSerialize(
  AppLocale object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.countryCode);
  writer.writeString(offsets[1], object.languageCode);
}

AppLocale _appLocaleDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AppLocale();
  object.countryCode = reader.readStringOrNull(offsets[0]);
  object.languageCode = reader.readString(offsets[1]);
  return object;
}

P _appLocaleDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension AppLocaleQueryFilter
    on QueryBuilder<AppLocale, AppLocale, QFilterCondition> {
  QueryBuilder<AppLocale, AppLocale, QAfterFilterCondition>
      countryCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'countryCode',
      ));
    });
  }

  QueryBuilder<AppLocale, AppLocale, QAfterFilterCondition>
      countryCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'countryCode',
      ));
    });
  }

  QueryBuilder<AppLocale, AppLocale, QAfterFilterCondition> countryCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'countryCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocale, AppLocale, QAfterFilterCondition>
      countryCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'countryCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocale, AppLocale, QAfterFilterCondition> countryCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'countryCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocale, AppLocale, QAfterFilterCondition> countryCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'countryCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocale, AppLocale, QAfterFilterCondition>
      countryCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'countryCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocale, AppLocale, QAfterFilterCondition> countryCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'countryCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocale, AppLocale, QAfterFilterCondition> countryCodeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'countryCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocale, AppLocale, QAfterFilterCondition> countryCodeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'countryCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocale, AppLocale, QAfterFilterCondition>
      countryCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'countryCode',
        value: '',
      ));
    });
  }

  QueryBuilder<AppLocale, AppLocale, QAfterFilterCondition>
      countryCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'countryCode',
        value: '',
      ));
    });
  }

  QueryBuilder<AppLocale, AppLocale, QAfterFilterCondition> languageCodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'languageCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocale, AppLocale, QAfterFilterCondition>
      languageCodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'languageCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocale, AppLocale, QAfterFilterCondition>
      languageCodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'languageCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocale, AppLocale, QAfterFilterCondition> languageCodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'languageCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocale, AppLocale, QAfterFilterCondition>
      languageCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'languageCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocale, AppLocale, QAfterFilterCondition>
      languageCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'languageCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocale, AppLocale, QAfterFilterCondition>
      languageCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'languageCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocale, AppLocale, QAfterFilterCondition> languageCodeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'languageCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocale, AppLocale, QAfterFilterCondition>
      languageCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'languageCode',
        value: '',
      ));
    });
  }

  QueryBuilder<AppLocale, AppLocale, QAfterFilterCondition>
      languageCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'languageCode',
        value: '',
      ));
    });
  }
}

extension AppLocaleQueryObject
    on QueryBuilder<AppLocale, AppLocale, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const AppThemeSchema = Schema(
  name: r'AppTheme',
  id: 1593164936082448787,
  properties: {
    r'brightness': PropertySchema(
      id: 0,
      name: r'brightness',
      type: IsarType.byte,
      enumMap: _AppThemebrightnessEnumValueMap,
    ),
    r'seed': PropertySchema(
      id: 1,
      name: r'seed',
      type: IsarType.byte,
      enumMap: _AppThemeseedEnumValueMap,
    )
  },
  estimateSize: _appThemeEstimateSize,
  serialize: _appThemeSerialize,
  deserialize: _appThemeDeserialize,
  deserializeProp: _appThemeDeserializeProp,
);

int _appThemeEstimateSize(
  AppTheme object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _appThemeSerialize(
  AppTheme object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeByte(offsets[0], object.brightness.index);
  writer.writeByte(offsets[1], object.seed.index);
}

AppTheme _appThemeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AppTheme(
    brightness:
        _AppThemebrightnessValueEnumMap[reader.readByteOrNull(offsets[0])] ??
            Brightness.dark,
    seed: _AppThemeseedValueEnumMap[reader.readByteOrNull(offsets[1])] ??
        ThemeSeed.blue,
  );
  return object;
}

P _appThemeDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_AppThemebrightnessValueEnumMap[reader.readByteOrNull(offset)] ??
          Brightness.dark) as P;
    case 1:
      return (_AppThemeseedValueEnumMap[reader.readByteOrNull(offset)] ??
          ThemeSeed.blue) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _AppThemebrightnessEnumValueMap = {
  'dark': 0,
  'light': 1,
};
const _AppThemebrightnessValueEnumMap = {
  0: Brightness.dark,
  1: Brightness.light,
};
const _AppThemeseedEnumValueMap = {
  'blue': 0,
  'green': 1,
  'yellow': 2,
  'orange': 3,
  'deepOrange': 4,
  'amber': 5,
  'cyan': 6,
  'indigo': 7,
  'pink': 8,
  'purple': 9,
  'red': 10,
  'teal': 11,
};
const _AppThemeseedValueEnumMap = {
  0: ThemeSeed.blue,
  1: ThemeSeed.green,
  2: ThemeSeed.yellow,
  3: ThemeSeed.orange,
  4: ThemeSeed.deepOrange,
  5: ThemeSeed.amber,
  6: ThemeSeed.cyan,
  7: ThemeSeed.indigo,
  8: ThemeSeed.pink,
  9: ThemeSeed.purple,
  10: ThemeSeed.red,
  11: ThemeSeed.teal,
};

extension AppThemeQueryFilter
    on QueryBuilder<AppTheme, AppTheme, QFilterCondition> {
  QueryBuilder<AppTheme, AppTheme, QAfterFilterCondition> brightnessEqualTo(
      Brightness value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brightness',
        value: value,
      ));
    });
  }

  QueryBuilder<AppTheme, AppTheme, QAfterFilterCondition> brightnessGreaterThan(
    Brightness value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'brightness',
        value: value,
      ));
    });
  }

  QueryBuilder<AppTheme, AppTheme, QAfterFilterCondition> brightnessLessThan(
    Brightness value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'brightness',
        value: value,
      ));
    });
  }

  QueryBuilder<AppTheme, AppTheme, QAfterFilterCondition> brightnessBetween(
    Brightness lower,
    Brightness upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'brightness',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AppTheme, AppTheme, QAfterFilterCondition> seedEqualTo(
      ThemeSeed value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'seed',
        value: value,
      ));
    });
  }

  QueryBuilder<AppTheme, AppTheme, QAfterFilterCondition> seedGreaterThan(
    ThemeSeed value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'seed',
        value: value,
      ));
    });
  }

  QueryBuilder<AppTheme, AppTheme, QAfterFilterCondition> seedLessThan(
    ThemeSeed value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'seed',
        value: value,
      ));
    });
  }

  QueryBuilder<AppTheme, AppTheme, QAfterFilterCondition> seedBetween(
    ThemeSeed lower,
    ThemeSeed upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'seed',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AppThemeQueryObject
    on QueryBuilder<AppTheme, AppTheme, QFilterCondition> {}
