import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
// import 'package:supabase_flutter/supabase_flutter.dart' as supabase;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/features/features.dart';

part 'orders_repository.g.dart';

class OrdersRepository {
  const OrdersRepository(
    this._remoteDataSource,
  );

  final IOrdersRemoteDataSource _remoteDataSource;

  Future<List<Order>> get(String uid) {
    return _remoteDataSource.get(uid);
  }

  Future<Order?> getById(String uid, String id) {
    return _remoteDataSource.getById(uid, id);
  }

  Future<Order?> latest(String uid) {
    return _remoteDataSource.latest(uid);
  }

  Future<int> count(String uid) {
    return _remoteDataSource.count(uid);
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

  // final remoteDataSource = OrdersSupabaseDataSource(
  //   supabase.Supabase.instance.client,
  // );

  return OrdersRepository(remoteDataSource);
}
