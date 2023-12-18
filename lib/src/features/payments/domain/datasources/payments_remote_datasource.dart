import 'package:shopit/src/features/features.dart';

abstract interface class IPaymentsRemoteDataSource {
  Future<List<Payment>> get();
  Future<Payment?> getById(String id);
}
