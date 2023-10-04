import 'package:isar/isar.dart';

import 'package:shopit/src/features/cart/cart.dart';

part 'local_cart.g.dart';

@collection
class LocalCart {
  Id? id;
  List<CartItem> items = [];
}

extension LocalCartExtension on LocalCart {
  Cart toCart() {
    return Cart(
      items: items,
    );
  }
}
