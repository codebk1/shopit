import 'package:shopit/src/features/carriers/carriers.dart';

abstract interface class ICarriersRemoteDataSource {
  Future<List<Carrier>> get();
  Future<Carrier?> getById(String id);
}
