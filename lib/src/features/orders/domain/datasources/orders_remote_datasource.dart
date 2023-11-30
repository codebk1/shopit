import 'package:shopit/src/features/orders/orders.dart';

abstract interface class IOrdersRemoteDataSource {
  Future<Order?> getById(String uid, String id);
  Future<List<Order>> get(String uid);
  Future<String> add(String uid, Order order);
}
