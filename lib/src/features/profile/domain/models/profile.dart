import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:shopit/src/features/wishlist/wishlist.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
class Profile with _$Profile {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory Profile({
    // ignore: invalid_annotation_target
    @JsonKey(includeToJson: false) required String id,
    required String firstName,
    required String lastName,
    @Default(Wishlist()) Wishlist wishlist,
  }) = _Profile;

  factory Profile.fromJson(Map<String, Object?> json) =>
      _$ProfileFromJson(json);
}
