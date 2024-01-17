import 'package:json_annotation/json_annotation.dart';
import 'package:drift/drift.dart';

import 'package:shopit/src/core/core.dart';

part 'cart_item.g.dart';

@JsonSerializable()
class CartItem implements Insertable<CartItem> {
  const CartItem({
    required this.id,
    required this.price,
    this.quantity = 1,
  });

  final String id;
  final double price;
  final int quantity;

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return CartItemsCompanion(
      id: Value(id),
      price: Value(price),
      quantity: Value(quantity),
    ).toColumns(nullToAbsent);
  }

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemToJson(this);

  CartItem copyWith({
    String? id,
    double? price,
    int? quantity,
  }) {
    return CartItem(
      id: id ?? this.id,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  bool operator ==(covariant CartItem other) {
    if (identical(this, other)) return true;

    return other.id == id && other.price == price && other.quantity == quantity;
  }

  @override
  int get hashCode => id.hashCode ^ price.hashCode ^ quantity.hashCode;

  @override
  String toString() => 'CartItem(id: $id, price: $price, quantity: $quantity)';
}
