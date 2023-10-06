import 'package:shopit/src/features/payments/payments.dart';

abstract interface class IPaymentsRemoteDataSource {
  Future<List<Payment>> get();
  Future<Payment?> getById(String id);
}
