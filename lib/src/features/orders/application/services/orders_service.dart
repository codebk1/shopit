import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/features/features.dart';

part 'orders_service.g.dart';

class OrdersService {
  const OrdersService(
    this._user,
    this._ordersRepository,
  );

  final User? _user;
  final OrdersRepository _ordersRepository;

  Future<List<Order>> get() async {
    return _user != null ? await _ordersRepository.get(_user.id) : [];
  }

  Future<Order?> byId(String id) async {
    return _user != null ? _ordersRepository.byId(_user.id, id) : null;
  }

  Future<Order?> latest() async {
    return _user != null ? _ordersRepository.latest(_user.id) : null;
  }

  Future<int> count() async {
    return _user != null ? await _ordersRepository.count(_user.id) : 0;
  }

  Future<String> add(Order order) async {
    return _user != null ? await _ordersRepository.add(_user.id, order) : '';
  }
}

@Riverpod(keepAlive: true)
OrdersService ordersService(OrdersServiceRef ref) {
  final user = ref.watch(authStateChangesProvider).valueOrNull;
  final ordersRepository = ref.read(ordersRepositoryProvider);

  return OrdersService(user, ordersRepository);
}

@riverpod
Future<List<Order>> orders(OrdersRef ref) {
  return ref.watch(ordersServiceProvider).get();
}

@riverpod
Future<Order?> order(OrderRef ref, String id) {
  return ref.watch(ordersServiceProvider).byId(id);
}

@riverpod
Future<Order?> latestOrder(LatestOrderRef ref) {
  return ref.watch(ordersServiceProvider).latest();
}

@riverpod
Future<int> ordersCount(OrdersCountRef ref) {
  return ref.watch(ordersServiceProvider).count();
}

@riverpod
Future<Map<DateTime, List<Order>>> groupedOrders(GroupedOrdersRef ref) async {
  final orders = await ref.watch(ordersProvider.future);

  final Map<DateTime, List<Order>> groupedOrders = {};

  for (var order in orders) {
    final key = DateTime(order.createdAt!.year, order.createdAt!.month);

    if (!groupedOrders.containsKey(key)) {
      groupedOrders[key] = [];
    }

    groupedOrders[key]!.add(order);
  }

  return groupedOrders;
}
