import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/features/features.dart';

part 'carriers_repository.g.dart';

class CarriersRepository {
  const CarriersRepository(this._remoteDataSource);

  final ICarriersRemoteDataSource _remoteDataSource;

  Future<List<Carrier>> get() {
    return _remoteDataSource.get();
  }

  Future<Carrier?> getById(String id) {
    return _remoteDataSource.getById(id);
  }
}

@Riverpod(keepAlive: true)
CarriersRepository carriersRepository(CarriersRepositoryRef ref) {
  final remoteDataSource = CarriersFirebaseDataSource(
    FirebaseFirestore.instance,
  );

  return CarriersRepository(remoteDataSource);
}

@riverpod
Future<List<Carrier>> carriers(CarriersRef ref) {
  return ref.read(carriersRepositoryProvider).get();
}

@riverpod
Future<Carrier?> carrier(CarrierRef ref, String id) {
  return ref.read(carriersRepositoryProvider).getById(id);
}
