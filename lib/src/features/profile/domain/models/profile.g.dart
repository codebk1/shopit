// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      deliveryAddress: json['deliveryAddress'] as String?,
      paymentAddress: json['paymentAddress'] as String?,
      wishlist: (json['wishlist'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      checkout: json['checkout'] == null
          ? const Checkout()
          : Checkout.fromJson(json['checkout'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'deliveryAddress': instance.deliveryAddress,
      'paymentAddress': instance.paymentAddress,
      'wishlist': instance.wishlist,
      'checkout': instance.checkout.toJson(),
    };
