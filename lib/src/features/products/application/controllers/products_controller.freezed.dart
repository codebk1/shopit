// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductsPageMeta {
  String get categoryId => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductsPageMetaCopyWith<ProductsPageMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsPageMetaCopyWith<$Res> {
  factory $ProductsPageMetaCopyWith(
          ProductsPageMeta value, $Res Function(ProductsPageMeta) then) =
      _$ProductsPageMetaCopyWithImpl<$Res, ProductsPageMeta>;
  @useResult
  $Res call({String categoryId, int page});
}

/// @nodoc
class _$ProductsPageMetaCopyWithImpl<$Res, $Val extends ProductsPageMeta>
    implements $ProductsPageMetaCopyWith<$Res> {
  _$ProductsPageMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? page = null,
  }) {
    return _then(_value.copyWith(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductsPageMetaCopyWith<$Res>
    implements $ProductsPageMetaCopyWith<$Res> {
  factory _$$_ProductsPageMetaCopyWith(
          _$_ProductsPageMeta value, $Res Function(_$_ProductsPageMeta) then) =
      __$$_ProductsPageMetaCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String categoryId, int page});
}

/// @nodoc
class __$$_ProductsPageMetaCopyWithImpl<$Res>
    extends _$ProductsPageMetaCopyWithImpl<$Res, _$_ProductsPageMeta>
    implements _$$_ProductsPageMetaCopyWith<$Res> {
  __$$_ProductsPageMetaCopyWithImpl(
      _$_ProductsPageMeta _value, $Res Function(_$_ProductsPageMeta) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? page = null,
  }) {
    return _then(_$_ProductsPageMeta(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ProductsPageMeta implements _ProductsPageMeta {
  _$_ProductsPageMeta({required this.categoryId, required this.page});

  @override
  final String categoryId;
  @override
  final int page;

  @override
  String toString() {
    return 'ProductsPageMeta(categoryId: $categoryId, page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductsPageMeta &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, categoryId, page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductsPageMetaCopyWith<_$_ProductsPageMeta> get copyWith =>
      __$$_ProductsPageMetaCopyWithImpl<_$_ProductsPageMeta>(this, _$identity);
}

abstract class _ProductsPageMeta implements ProductsPageMeta {
  factory _ProductsPageMeta(
      {required final String categoryId,
      required final int page}) = _$_ProductsPageMeta;

  @override
  String get categoryId;
  @override
  int get page;
  @override
  @JsonKey(ignore: true)
  _$$_ProductsPageMetaCopyWith<_$_ProductsPageMeta> get copyWith =>
      throw _privateConstructorUsedError;
}
