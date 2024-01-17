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
mixin _$PageMeta<T> {
  List<T> get items => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get noMoreItems => throw _privateConstructorUsedError;
  Object? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PageMetaCopyWith<T, PageMeta<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageMetaCopyWith<T, $Res> {
  factory $PageMetaCopyWith(
          PageMeta<T> value, $Res Function(PageMeta<T>) then) =
      _$PageMetaCopyWithImpl<T, $Res, PageMeta<T>>;
  @useResult
  $Res call({List<T> items, bool isLoading, bool noMoreItems, Object? error});
}

/// @nodoc
class _$PageMetaCopyWithImpl<T, $Res, $Val extends PageMeta<T>>
    implements $PageMetaCopyWith<T, $Res> {
  _$PageMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? isLoading = null,
    Object? noMoreItems = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      noMoreItems: null == noMoreItems
          ? _value.noMoreItems
          : noMoreItems // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error ? _value.error : error,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PageMetaImplCopyWith<T, $Res>
    implements $PageMetaCopyWith<T, $Res> {
  factory _$$PageMetaImplCopyWith(
          _$PageMetaImpl<T> value, $Res Function(_$PageMetaImpl<T>) then) =
      __$$PageMetaImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({List<T> items, bool isLoading, bool noMoreItems, Object? error});
}

/// @nodoc
class __$$PageMetaImplCopyWithImpl<T, $Res>
    extends _$PageMetaCopyWithImpl<T, $Res, _$PageMetaImpl<T>>
    implements _$$PageMetaImplCopyWith<T, $Res> {
  __$$PageMetaImplCopyWithImpl(
      _$PageMetaImpl<T> _value, $Res Function(_$PageMetaImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? isLoading = null,
    Object? noMoreItems = null,
    Object? error = freezed,
  }) {
    return _then(_$PageMetaImpl<T>(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      noMoreItems: null == noMoreItems
          ? _value.noMoreItems
          : noMoreItems // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$PageMetaImpl<T> implements _PageMeta<T> {
  const _$PageMetaImpl(
      {required final List<T> items,
      this.isLoading = false,
      this.noMoreItems = false,
      this.error})
      : _items = items;

  final List<T> _items;
  @override
  List<T> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool noMoreItems;
  @override
  final Object? error;

  @override
  String toString() {
    return 'PageMeta<$T>(items: $items, isLoading: $isLoading, noMoreItems: $noMoreItems, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PageMetaImpl<T> &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.noMoreItems, noMoreItems) ||
                other.noMoreItems == noMoreItems) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      isLoading,
      noMoreItems,
      const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PageMetaImplCopyWith<T, _$PageMetaImpl<T>> get copyWith =>
      __$$PageMetaImplCopyWithImpl<T, _$PageMetaImpl<T>>(this, _$identity);
}

abstract class _PageMeta<T> implements PageMeta<T> {
  const factory _PageMeta(
      {required final List<T> items,
      final bool isLoading,
      final bool noMoreItems,
      final Object? error}) = _$PageMetaImpl<T>;

  @override
  List<T> get items;
  @override
  bool get isLoading;
  @override
  bool get noMoreItems;
  @override
  Object? get error;
  @override
  @JsonKey(ignore: true)
  _$$PageMetaImplCopyWith<T, _$PageMetaImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
