import 'package:shopit/src/features/categories/categories.dart';

abstract interface class ICategoriesRemoteDataSource {
  Future<int> count();
  Future<List<Category>> paginate(String startAfter, int limit);
  Future<List<Category>> featured();
  Future<List<Category>> byIds(List<String> ids);
}
