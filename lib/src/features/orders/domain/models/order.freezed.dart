// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Order _$OrderFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
mixin _$Order {
  @JsonKey(includeToJson: false)
  String? get id => throw _privateConstructorUsedError;
  int? get number => throw _privateConstructorUsedError;
  OrderStatus get status => throw _privateConstructorUsedError;
  Carrier get carrier => throw _privateConstructorUsedError;
  Payment get payment => throw _privateConstructorUsedError;
  Address get deliveryAddress => throw _privateConstructorUsedError;
  Address get paymentAddress => throw _privateConstructorUsedError;
  List<CartItem> get items => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderCopyWith<Order> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res, Order>;
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) String? id,
      int? number,
      OrderStatus status,
      Carrier carrier,
      Payment payment,
      Address deliveryAddress,
      Address paymentAddress,
      List<CartItem> items,
      String? comment,
      DateTime? createdAt,
      DateTime? updatedAt});

  $CarrierCopyWith<$Res> get carrier;
  $PaymentCopyWith<$Res> get payment;
  $AddressCopyWith<$Res> get deliveryAddress;
  $AddressCopyWith<$Res> get paymentAddress;
}

/// @nodoc
class _$OrderCopyWithImpl<$Res, $Val extends Order>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? number = freezed,
    Object? status = null,
    Object? carrier = null,
    Object? payment = null,
    Object? deliveryAddress = null,
    Object? paymentAddress = null,
    Object? items = null,
    Object? comment = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      carrier: null == carrier
          ? _value.carrier
          : carrier // ignore: cast_nullable_to_non_nullable
              as Carrier,
      payment: null == payment
          ? _value.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as Payment,
      deliveryAddress: null == deliveryAddress
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as Address,
      paymentAddress: null == paymentAddress
          ? _value.paymentAddress
          : paymentAddress // ignore: cast_nullable_to_non_nullable
              as Address,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CarrierCopyWith<$Res> get carrier {
    return $CarrierCopyWith<$Res>(_value.carrier, (value) {
      return _then(_value.copyWith(carrier: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentCopyWith<$Res> get payment {
    return $PaymentCopyWith<$Res>(_value.payment, (value) {
      return _then(_value.copyWith(payment: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get deliveryAddress {
    return $AddressCopyWith<$Res>(_value.deliveryAddress, (value) {
      return _then(_value.copyWith(deliveryAddress: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get paymentAddress {
    return $AddressCopyWith<$Res>(_value.paymentAddress, (value) {
      return _then(_value.copyWith(paymentAddress: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderImplCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$$OrderImplCopyWith(
          _$OrderImpl value, $Res Function(_$OrderImpl) then) =
      __$$OrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) String? id,
      int? number,
      OrderStatus status,
      Carrier carrier,
      Payment payment,
      Address deliveryAddress,
      Address paymentAddress,
      List<CartItem> items,
      String? comment,
      DateTime? createdAt,
      DateTime? updatedAt});

  @override
  $CarrierCopyWith<$Res> get carrier;
  @override
  $PaymentCopyWith<$Res> get payment;
  @override
  $AddressCopyWith<$Res> get deliveryAddress;
  @override
  $AddressCopyWith<$Res> get paymentAddress;
}

/// @nodoc
class __$$OrderImplCopyWithImpl<$Res>
    extends _$OrderCopyWithImpl<$Res, _$OrderImpl>
    implements _$$OrderImplCopyWith<$Res> {
  __$$OrderImplCopyWithImpl(
      _$OrderImpl _value, $Res Function(_$OrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? number = freezed,
    Object? status = null,
    Object? carrier = null,
    Object? payment = null,
    Object? deliveryAddress = null,
    Object? paymentAddress = null,
    Object? items = null,
    Object? comment = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$OrderImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      carrier: null == carrier
          ? _value.carrier
          : carrier // ignore: cast_nullable_to_non_nullable
              as Carrier,
      payment: null == payment
          ? _value.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as Payment,
      deliveryAddress: null == deliveryAddress
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as Address,
      paymentAddress: null == paymentAddress
          ? _value.paymentAddress
          : paymentAddress // ignore: cast_nullable_to_non_nullable
              as Address,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$OrderImpl extends _Order {
  const _$OrderImpl(
      {@JsonKey(includeToJson: false) this.id,
      this.number,
      this.status = OrderStatus.ordered,
      required this.carrier,
      required this.payment,
      required this.deliveryAddress,
      required this.paymentAddress,
      required final List<CartItem> items,
      this.comment,
      this.createdAt,
      this.updatedAt})
      : _items = items,
        super._();

  factory _$OrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderImplFromJson(json);

  @override
  @JsonKey(includeToJson: false)
  final String? id;
  @override
  final int? number;
  @override
  @JsonKey()
  final OrderStatus status;
  @override
  final Carrier carrier;
  @override
  final Payment payment;
  @override
  final Address deliveryAddress;
  @override
  final Address paymentAddress;
  final List<CartItem> _items;
  @override
  List<CartItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final String? comment;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Order(id: $id, number: $number, status: $status, carrier: $carrier, payment: $payment, deliveryAddress: $deliveryAddress, paymentAddress: $paymentAddress, items: $items, comment: $comment, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.carrier, carrier) || other.carrier == carrier) &&
            (identical(other.payment, payment) || other.payment == payment) &&
            (identical(other.deliveryAddress, deliveryAddress) ||
                other.deliveryAddress == deliveryAddress) &&
            (identical(other.paymentAddress, paymentAddress) ||
                other.paymentAddress == paymentAddress) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      number,
      status,
      carrier,
      payment,
      deliveryAddress,
      paymentAddress,
      const DeepCollectionEquality().hash(_items),
      comment,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      __$$OrderImplCopyWithImpl<_$OrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderImplToJson(
      this,
    );
  }
}

abstract class _Order extends Order {
  const factory _Order(
      {@JsonKey(includeToJson: false) final String? id,
      final int? number,
      final OrderStatus status,
      required final Carrier carrier,
      required final Payment payment,
      required final Address deliveryAddress,
      required final Address paymentAddress,
      required final List<CartItem> items,
      final String? comment,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$OrderImpl;
  const _Order._() : super._();

  factory _Order.fromJson(Map<String, dynamic> json) = _$OrderImpl.fromJson;

  @override
  @JsonKey(includeToJson: false)
  String? get id;
  @override
  int? get number;
  @override
  OrderStatus get status;
  @override
  Carrier get carrier;
  @override
  Payment get payment;
  @override
  Address get deliveryAddress;
  @override
  Address get paymentAddress;
  @override
  List<CartItem> get items;
  @override
  String? get comment;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
