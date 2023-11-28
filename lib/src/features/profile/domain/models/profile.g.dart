// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileImpl _$$ProfileImplFromJson(Map<String, dynamic> json) =>
    _$ProfileImpl(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      deliveryAddress: json['deliveryAddress'] as String?,
      paymentAddress: json['paymentAddress'] as String?,
      wishlist: json['wishlist'] == null
          ? const Wishlist()
          : Wishlist.fromJson(json['wishlist'] as Map<String, dynamic>),
      checkout: json['checkout'] == null
          ? const Checkout()
          : Checkout.fromJson(json['checkout'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProfileImplToJson(_$ProfileImpl instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'deliveryAddress': instance.deliveryAddress,
      'paymentAddress': instance.paymentAddress,
      'wishlist': instance.wishlist.toJson(),
      'checkout': instance.checkout.toJson(),
    };
