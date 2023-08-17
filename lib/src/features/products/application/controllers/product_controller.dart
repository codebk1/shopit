import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/features/products/products.dart';

part 'product_controller.g.dart';

@Riverpod(dependencies: [])
String productId(ProductIdRef ref) {
  throw UnimplementedError();
}

@riverpod
Future<Product?> product(ProductRef ref, String id) async {
  final product = await ref.read(productsRepositoryProvider).getById(id);

  // cache provider only when we have product
  final link = ref.keepAlive();
  final timer = Timer(const Duration(seconds: 60), () => link.close());
  ref.onDispose(() => timer.cancel());

  return product;
}
