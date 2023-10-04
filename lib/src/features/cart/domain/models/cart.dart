import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:shopit/src/features/cart/cart.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

@freezed
class Cart with _$Cart {
  @JsonSerializable(explicitToJson: true)
  const factory Cart({
    @Default([]) List<CartItem> items,
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
