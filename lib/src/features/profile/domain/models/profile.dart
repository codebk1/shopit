import 'package:flutter/foundation.dart';

import 'package:json_annotation/json_annotation.dart';

import 'package:shopit/src/features/features.dart';

part 'profile.g.dart';

@JsonSerializable(explicitToJson: true)
class Profile {
  const Profile({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.avatar,
    this.deliveryAddress,
    this.paymentAddress,
    this.wishlist = const [],
    this.checkout = const Checkout(),
  });

  @JsonKey(includeToJson: false)
  final String id;

  final String firstName;
  final String lastName;

  @JsonKey(includeFromJson: false, includeToJson: false)
  final String? avatar;

  final String? deliveryAddress;
  final String? paymentAddress;
  final List<String> wishlist;
  final Checkout checkout;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);

  Profile copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? avatar,
    String? deliveryAddress,
    String? paymentAddress,
    List<String>? wishlist,
    Checkout? checkout,
  }) {
    return Profile(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      avatar: avatar ?? this.avatar,
      deliveryAddress: deliveryAddress ?? this.deliveryAddress,
      paymentAddress: paymentAddress ?? this.paymentAddress,
      wishlist: wishlist ?? this.wishlist,
      checkout: checkout ?? this.checkout,
    );
  }

  @override
  bool operator ==(covariant Profile other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.avatar == avatar &&
        other.deliveryAddress == deliveryAddress &&
        other.paymentAddress == paymentAddress &&
        listEquals(other.wishlist, wishlist) &&
        other.checkout == checkout;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        avatar.hashCode ^
        deliveryAddress.hashCode ^
        paymentAddress.hashCode ^
        wishlist.hashCode ^
        checkout.hashCode;
  }

  @override
  String toString() {
    return 'Profile(id: $id, firstName: $firstName, lastName: $lastName, avatar: $avatar, deliveryAddress: $deliveryAddress, paymentAddress: $paymentAddress, wishlist: $wishlist, checkout: $checkout)';
  }
}
