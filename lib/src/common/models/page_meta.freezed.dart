// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page_meta.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PageMeta {
  String get itemId => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PageMetaCopyWith<PageMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageMetaCopyWith<$Res> {
  factory $PageMetaCopyWith(PageMeta value, $Res Function(PageMeta) then) =
      _$PageMetaCopyWithImpl<$Res, PageMeta>;
  @useResult
  $Res call({String itemId, int page});
}

/// @nodoc
class _$PageMetaCopyWithImpl<$Res, $Val extends PageMeta>
    implements $PageMetaCopyWith<$Res> {
  _$PageMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
    Object? page = null,
  }) {
    return _then(_value.copyWith(
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PageMetaCopyWith<$Res> implements $PageMetaCopyWith<$Res> {
  factory _$$_PageMetaCopyWith(
          _$_PageMeta value, $Res Function(_$_PageMeta) then) =
      __$$_PageMetaCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String itemId, int page});
}

/// @nodoc
class __$$_PageMetaCopyWithImpl<$Res>
    extends _$PageMetaCopyWithImpl<$Res, _$_PageMeta>
    implements _$$_PageMetaCopyWith<$Res> {
  __$$_PageMetaCopyWithImpl(
      _$_PageMeta _value, $Res Function(_$_PageMeta) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
    Object? page = null,
  }) {
    return _then(_$_PageMeta(
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_PageMeta implements _PageMeta {
  const _$_PageMeta({required this.itemId, required this.page});

  @override
  final String itemId;
  @override
  final int page;

  @override
  String toString() {
    return 'PageMeta(itemId: $itemId, page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PageMeta &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, itemId, page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PageMetaCopyWith<_$_PageMeta> get copyWith =>
      __$$_PageMetaCopyWithImpl<_$_PageMeta>(this, _$identity);
}

abstract class _PageMeta implements PageMeta {
  const factory _PageMeta(
      {required final String itemId, required final int page}) = _$_PageMeta;

  @override
  String get itemId;
  @override
  int get page;
  @override
  @JsonKey(ignore: true)
  _$$_PageMetaCopyWith<_$_PageMeta> get copyWith =>
      throw _privateConstructorUsedError;
}
