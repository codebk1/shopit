import 'package:shopit/src/features/features.dart';

abstract interface class IOrdersRemoteDataSource {
  Future<List<Order>> get(String uid);
  Future<Order?> getById(String uid, String id);
  Future<Order?> latest(String uid);
  Future<int> count(String uid);
  Future<String> add(String uid, Order order);
}
