import 'package:shopit/src/features/features.dart';

abstract interface class ICarriersRemoteDataSource {
  Future<List<Carrier>> get();
  Future<Carrier?> getById(String id);
}
