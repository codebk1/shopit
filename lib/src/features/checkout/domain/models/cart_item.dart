import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'cart_item.freezed.dart';
part 'cart_item.g.dart';

@freezed
@Embedded(ignore: {'copyWith'})
class CartItem with _$CartItem {
  const factory CartItem({
    required String id,
    required double price,
    @Default(1) int quantity,
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, Object?> json) =>
      _$CartItemFromJson(json);
}
