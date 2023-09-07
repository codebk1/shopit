import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:shopit/src/features/wishlist/wishlist.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
class Profile with _$Profile {
  @JsonSerializable(explicitToJson: true)
  const factory Profile({
    @JsonKey(includeToJson: false) required String id,
    required String firstName,
    required String lastName,
    @JsonKey(includeFromJson: false, includeToJson: false) String? avatar,
    @Default(Wishlist()) Wishlist wishlist,
    String? deliveryAddress,
    String? billingAddress,
  }) = _Profile;

  factory Profile.fromJson(Map<String, Object?> json) =>
      _$ProfileFromJson(json);
}
