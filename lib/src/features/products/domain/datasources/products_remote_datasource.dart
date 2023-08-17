import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/products/products.dart';

abstract interface class IProductsRemoteDataSource {
  Future<Product?> getById(String id);
  Future<int> countByCategoryId(String id);

  Future<List<Product>> paginateByCategory(
    String id,
    Product? startAfter,
    int limit,
    Sort sort,
  );

  Future<List<Product>> featured();
}
