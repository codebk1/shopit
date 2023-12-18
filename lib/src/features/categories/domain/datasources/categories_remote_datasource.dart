import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/features.dart';

abstract interface class ICategoriesRemoteDataSource {
  Future<int> count();
  Future<List<Category>> paginate(String startAfter, int limit, Sort sort);
  Future<List<Category>> featured();
  Future<List<Category>> byIds(List<String> ids);
}
