import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:shopit/src/features/cart/domain/entities/item.dart';
import 'package:shopit/src/features/cart/domain/schemas/local_cart.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

enum CartState {
  active,
  abandoned,
}

@freezed
class Cart with _$Cart {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory Cart({
    // ignore: invalid_annotation_target
    @JsonKey(includeToJson: false) String? id,
    required String userId,
    @Default(CartState.active) CartState state,
    @Default(15.0) double shipping,
    @Default([]) List<Item> items,
  }) = _Cart;

  factory Cart.fromJson(Map<String, Object?> json) => _$CartFromJson(json);
}

extension CartExtension on Cart {
  LocalCart toLocalCart() {
    return LocalCart()
      ..id = 1
      ..items = items;
  }
}
