// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Checkout _$CheckoutFromJson(Map<String, dynamic> json) => Checkout(
      currentStep: json['currentStep'] as int? ?? 1,
      carrierId: json['carrierId'] as String?,
      paymentId: json['paymentId'] as String?,
      deliveryAddressId: json['deliveryAddressId'] as String?,
      paymentAddressId: json['paymentAddressId'] as String?,
      comment: json['comment'] as String?,
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$CheckoutToJson(Checkout instance) => <String, dynamic>{
      'currentStep': instance.currentStep,
      'carrierId': instance.carrierId,
      'paymentId': instance.paymentId,
      'deliveryAddressId': instance.deliveryAddressId,
      'paymentAddressId': instance.paymentAddressId,
      'comment': instance.comment,
      'items': instance.items.map((e) => e.toJson()).toList(),
    };
