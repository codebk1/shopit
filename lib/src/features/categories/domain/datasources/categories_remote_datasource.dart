import 'package:shopit/src/features/categories/domain/entities/category.dart';

abstract class ICategoriesRemoteDataSource {
  Future<int> count();
  Future<List<Category>> paginate(String startAfter, int limit);
  Future<List<Category>> featured();
  Future<List<Category>> byIds(List<String> ids);
}
