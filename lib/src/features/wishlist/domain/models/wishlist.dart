import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'wishlist.freezed.dart';
part 'wishlist.g.dart';

@freezed
@collection
class Wishlist with _$Wishlist {
  const factory Wishlist({
    @JsonKey(includeToJson: false) @Default('1') String id, // required by Isar
    @Default([]) List<String> items,
  }) = _Wishlist;

  factory Wishlist.fromJson(Map<String, Object?> json) =>
      _$WishlistFromJson(json);
}
