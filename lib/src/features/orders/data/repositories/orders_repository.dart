import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/features/orders/orders.dart';

part 'orders_repository.g.dart';

class OrdersRepository {
  const OrdersRepository(
    this._remoteDataSource,
  );

  final IOrdersRemoteDataSource _remoteDataSource;

  Future<Order?> getById(String uid, String id) {
    return _remoteDataSource.getById(uid, id);
  }

  Future<List<Order>> get(String uid) {
    return _remoteDataSource.get(uid);
  }

  Future<String> add(String uid, Order order) {
    return _remoteDataSource.add(uid, order);
  }
}

@Riverpod(keepAlive: true)
OrdersRepository ordersRepository(OrdersRepositoryRef ref) {
  final remoteDataSource = OrdersFirebaseDataSource(
    firestore.FirebaseFirestore.instance,
  );

  return OrdersRepository(remoteDataSource);
}
