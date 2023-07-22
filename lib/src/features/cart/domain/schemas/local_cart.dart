import 'package:isar/isar.dart';

import 'package:shopit/src/features/cart/domain/entities/cart.dart';
import 'package:shopit/src/features/cart/domain/entities/item.dart';

part 'local_cart.g.dart';

@collection
class LocalCart {
  Id? id;
  List<Item> items = [];
}

extension LocalCartToCart on LocalCart {
  Cart toCart() {
    return Cart(
      id: '',
      userId: '',
      items: items,
    );
  }
}
