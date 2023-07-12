import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'wishlist.freezed.dart';
part 'wishlist.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Wishlist with _$Wishlist {
  const Wishlist._();

  const factory Wishlist({
    Id? id,
    @Default([]) List<String> items,
  }) = _Wishlist;

  @JsonKey(includeToJson: false)
  @override
  Id? get id => Isar.autoIncrement;

  factory Wishlist.fromJson(Map<String, Object?> json) =>
      _$WishlistFromJson(json);
}
