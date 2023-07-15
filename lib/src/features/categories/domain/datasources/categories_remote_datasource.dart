import 'package:shopit/src/features/categories/domain/entities/category.dart';

abstract class ICategoriesRemoteDataSource {
  Future<List<Category>> getCategories(String startAfterName, int limit);
  Future<int> getCategoriesCount();
}
