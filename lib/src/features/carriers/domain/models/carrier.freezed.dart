// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'carrier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Carrier _$CarrierFromJson(Map<String, dynamic> json) {
  return _Carrier.fromJson(json);
}

/// @nodoc
mixin _$Carrier {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  CarrierType get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CarrierCopyWith<Carrier> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarrierCopyWith<$Res> {
  factory $CarrierCopyWith(Carrier value, $Res Function(Carrier) then) =
      _$CarrierCopyWithImpl<$Res, Carrier>;
  @useResult
  $Res call({String id, String name, double price, CarrierType type});
}

/// @nodoc
class _$CarrierCopyWithImpl<$Res, $Val extends Carrier>
    implements $CarrierCopyWith<$Res> {
  _$CarrierCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CarrierType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CarrierImplCopyWith<$Res> implements $CarrierCopyWith<$Res> {
  factory _$$CarrierImplCopyWith(
          _$CarrierImpl value, $Res Function(_$CarrierImpl) then) =
      __$$CarrierImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, double price, CarrierType type});
}

/// @nodoc
class __$$CarrierImplCopyWithImpl<$Res>
    extends _$CarrierCopyWithImpl<$Res, _$CarrierImpl>
    implements _$$CarrierImplCopyWith<$Res> {
  __$$CarrierImplCopyWithImpl(
      _$CarrierImpl _value, $Res Function(_$CarrierImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? type = null,
  }) {
    return _then(_$CarrierImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CarrierType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CarrierImpl implements _Carrier {
  const _$CarrierImpl(
      {required this.id,
      required this.name,
      required this.price,
      required this.type});

  factory _$CarrierImpl.fromJson(Map<String, dynamic> json) =>
      _$$CarrierImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final double price;
  @override
  final CarrierType type;

  @override
  String toString() {
    return 'Carrier(id: $id, name: $name, price: $price, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CarrierImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, price, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CarrierImplCopyWith<_$CarrierImpl> get copyWith =>
      __$$CarrierImplCopyWithImpl<_$CarrierImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CarrierImplToJson(
      this,
    );
  }
}

abstract class _Carrier implements Carrier {
  const factory _Carrier(
      {required final String id,
      required final String name,
      required final double price,
      required final CarrierType type}) = _$CarrierImpl;

  factory _Carrier.fromJson(Map<String, dynamic> json) = _$CarrierImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  double get price;
  @override
  CarrierType get type;
  @override
  @JsonKey(ignore: true)
  _$$CarrierImplCopyWith<_$CarrierImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
