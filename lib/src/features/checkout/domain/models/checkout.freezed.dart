// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Checkout _$CheckoutFromJson(Map<String, dynamic> json) {
  return _Checkout.fromJson(json);
}

/// @nodoc
mixin _$Checkout {
  @JsonKey(includeToJson: false)
  String get id => throw _privateConstructorUsedError; // required by Isar
  int get currentStep => throw _privateConstructorUsedError;
  String? get carrierId => throw _privateConstructorUsedError;
  String? get paymentId => throw _privateConstructorUsedError;
  String? get deliveryAddressId => throw _privateConstructorUsedError;
  String? get paymentAddressId => throw _privateConstructorUsedError;
  List<CartItem> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CheckoutCopyWith<Checkout> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutCopyWith<$Res> {
  factory $CheckoutCopyWith(Checkout value, $Res Function(Checkout) then) =
      _$CheckoutCopyWithImpl<$Res, Checkout>;
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) String id,
      int currentStep,
      String? carrierId,
      String? paymentId,
      String? deliveryAddressId,
      String? paymentAddressId,
      List<CartItem> items});
}

/// @nodoc
class _$CheckoutCopyWithImpl<$Res, $Val extends Checkout>
    implements $CheckoutCopyWith<$Res> {
  _$CheckoutCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? currentStep = null,
    Object? carrierId = freezed,
    Object? paymentId = freezed,
    Object? deliveryAddressId = freezed,
    Object? paymentAddressId = freezed,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      currentStep: null == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as int,
      carrierId: freezed == carrierId
          ? _value.carrierId
          : carrierId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentId: freezed == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryAddressId: freezed == deliveryAddressId
          ? _value.deliveryAddressId
          : deliveryAddressId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentAddressId: freezed == paymentAddressId
          ? _value.paymentAddressId
          : paymentAddressId // ignore: cast_nullable_to_non_nullable
              as String?,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CheckoutCopyWith<$Res> implements $CheckoutCopyWith<$Res> {
  factory _$$_CheckoutCopyWith(
          _$_Checkout value, $Res Function(_$_Checkout) then) =
      __$$_CheckoutCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) String id,
      int currentStep,
      String? carrierId,
      String? paymentId,
      String? deliveryAddressId,
      String? paymentAddressId,
      List<CartItem> items});
}

/// @nodoc
class __$$_CheckoutCopyWithImpl<$Res>
    extends _$CheckoutCopyWithImpl<$Res, _$_Checkout>
    implements _$$_CheckoutCopyWith<$Res> {
  __$$_CheckoutCopyWithImpl(
      _$_Checkout _value, $Res Function(_$_Checkout) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? currentStep = null,
    Object? carrierId = freezed,
    Object? paymentId = freezed,
    Object? deliveryAddressId = freezed,
    Object? paymentAddressId = freezed,
    Object? items = null,
  }) {
    return _then(_$_Checkout(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      currentStep: null == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as int,
      carrierId: freezed == carrierId
          ? _value.carrierId
          : carrierId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentId: freezed == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryAddressId: freezed == deliveryAddressId
          ? _value.deliveryAddressId
          : deliveryAddressId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentAddressId: freezed == paymentAddressId
          ? _value.paymentAddressId
          : paymentAddressId // ignore: cast_nullable_to_non_nullable
              as String?,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Checkout extends _Checkout {
  const _$_Checkout(
      {@JsonKey(includeToJson: false) this.id = '1',
      this.currentStep = 1,
      this.carrierId,
      this.paymentId,
      this.deliveryAddressId,
      this.paymentAddressId,
      final List<CartItem> items = const []})
      : _items = items,
        super._();

  factory _$_Checkout.fromJson(Map<String, dynamic> json) =>
      _$$_CheckoutFromJson(json);

  @override
  @JsonKey(includeToJson: false)
  final String id;
// required by Isar
  @override
  @JsonKey()
  final int currentStep;
  @override
  final String? carrierId;
  @override
  final String? paymentId;
  @override
  final String? deliveryAddressId;
  @override
  final String? paymentAddressId;
  final List<CartItem> _items;
  @override
  @JsonKey()
  List<CartItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'Checkout(id: $id, currentStep: $currentStep, carrierId: $carrierId, paymentId: $paymentId, deliveryAddressId: $deliveryAddressId, paymentAddressId: $paymentAddressId, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Checkout &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep) &&
            (identical(other.carrierId, carrierId) ||
                other.carrierId == carrierId) &&
            (identical(other.paymentId, paymentId) ||
                other.paymentId == paymentId) &&
            (identical(other.deliveryAddressId, deliveryAddressId) ||
                other.deliveryAddressId == deliveryAddressId) &&
            (identical(other.paymentAddressId, paymentAddressId) ||
                other.paymentAddressId == paymentAddressId) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      currentStep,
      carrierId,
      paymentId,
      deliveryAddressId,
      paymentAddressId,
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CheckoutCopyWith<_$_Checkout> get copyWith =>
      __$$_CheckoutCopyWithImpl<_$_Checkout>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CheckoutToJson(
      this,
    );
  }
}

abstract class _Checkout extends Checkout {
  const factory _Checkout(
      {@JsonKey(includeToJson: false) final String id,
      final int currentStep,
      final String? carrierId,
      final String? paymentId,
      final String? deliveryAddressId,
      final String? paymentAddressId,
      final List<CartItem> items}) = _$_Checkout;
  const _Checkout._() : super._();

  factory _Checkout.fromJson(Map<String, dynamic> json) = _$_Checkout.fromJson;

  @override
  @JsonKey(includeToJson: false)
  String get id;
  @override // required by Isar
  int get currentStep;
  @override
  String? get carrierId;
  @override
  String? get paymentId;
  @override
  String? get deliveryAddressId;
  @override
  String? get paymentAddressId;
  @override
  List<CartItem> get items;
  @override
  @JsonKey(ignore: true)
  _$$_CheckoutCopyWith<_$_Checkout> get copyWith =>
      throw _privateConstructorUsedError;
}
