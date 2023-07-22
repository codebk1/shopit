import 'package:shopit/src/features/products/domain/entities/product.dart';

abstract class IProductsRemoteDataSource {
  Future<Product?> getById(String id);
  Future<int> countByCategoryId(String id);

  Future<List<Product>> paginateByCategory(
    String id,
    String startAfter,
    int limit,
  );

  Future<List<Product>> featured();
}
