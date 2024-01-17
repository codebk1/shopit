import 'package:freezed_annotation/freezed_annotation.dart';

part 'carrier.freezed.dart';
part 'carrier.g.dart';

enum CarrierType { selfPickup, courier, parcelLocker }

@freezed
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
