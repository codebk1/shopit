import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'carrier.freezed.dart';
part 'carrier.g.dart';

enum CarrierType { selfPickup, courier, parcelLocker }

@freezed
@Embedded(ignore: {'copyWith'})
class Carrier with _$Carrier {
  const factory Carrier({
    required String id,
    required String name,
    required double price,
    required CarrierType type,
  }) = _Carrier;

  factory Carrier.fromJson(Map<String, Object?> json) =>
      _$CarrierFromJson(json);
}
