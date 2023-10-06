import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/features/payments/payments.dart';

part 'payments_repository.g.dart';

class PaymentsRepository {
  const PaymentsRepository(this._remoteDataSource);

  final IPaymentsRemoteDataSource _remoteDataSource;

  Future<List<Payment>> get() {
    return _remoteDataSource.get();
  }

  Future<Payment?> getById(String id) {
    return _remoteDataSource.getById(id);
  }
}

@Riverpod(keepAlive: true)
PaymentsRepository paymentsRepository(PaymentsRepositoryRef ref) {
  final remoteDataSource = PaymentsFirebaseDataSource(
    FirebaseFirestore.instance,
  );

  return PaymentsRepository(remoteDataSource);
}

@riverpod
Future<List<Payment>> payments(PaymentsRef ref) {
  return ref.read(paymentsRepositoryProvider).get();
}

@riverpod
Future<Payment?> payment(PaymentRef ref, String id) {
  return ref.read(paymentsRepositoryProvider).getById(id);
}
