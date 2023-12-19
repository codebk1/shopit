// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      id: json['id'] as String?,
      number: json['number'] as int?,
      status: $enumDecodeNullable(_$OrderStatusEnumMap, json['status']) ??
          OrderStatus.ordered,
      carrier: Carrier.fromJson(json['carrier'] as Map<String, dynamic>),
      payment: Payment.fromJson(json['payment'] as Map<String, dynamic>),
      deliveryAddress:
          Address.fromJson(json['deliveryAddress'] as Map<String, dynamic>),
      paymentAddress:
          Address.fromJson(json['paymentAddress'] as Map<String, dynamic>),
      items: (json['items'] as List<dynamic>)
          .map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      comment: json['comment'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      'number': instance.number,
      'status': _$OrderStatusEnumMap[instance.status]!,
      'carrier': instance.carrier.toJson(),
      'payment': instance.payment.toJson(),
      'deliveryAddress': instance.deliveryAddress.toJson(),
      'paymentAddress': instance.paymentAddress.toJson(),
      'items': instance.items.map((e) => e.toJson()).toList(),
      'comment': instance.comment,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$OrderStatusEnumMap = {
  OrderStatus.ordered: 'ordered',
  OrderStatus.preparing: 'preparing',
  OrderStatus.dispatched: 'dispatched',
  OrderStatus.delivered: 'delivered',
  OrderStatus.cancelled: 'cancelled',
};
