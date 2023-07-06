import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'isar_provider.g.dart';

@Riverpod(keepAlive: true)
Isar isar(IsarRef ref) {
  throw Exception('Provider was not initialised.');
}
