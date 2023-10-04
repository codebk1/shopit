// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Profile _$$_ProfileFromJson(Map<String, dynamic> json) => _$_Profile(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      deliveryAddress: json['deliveryAddress'] as String?,
      paymentAddress: json['paymentAddress'] as String?,
      wishlist: json['wishlist'] == null
          ? const Wishlist()
          : Wishlist.fromJson(json['wishlist'] as Map<String, dynamic>),
      cart: json['cart'] == null
          ? const Cart()
          : Cart.fromJson(json['cart'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ProfileToJson(_$_Profile instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'deliveryAddress': instance.deliveryAddress,
      'paymentAddress': instance.paymentAddress,
      'wishlist': instance.wishlist.toJson(),
      'cart': instance.cart.toJson(),
    };
