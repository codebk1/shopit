import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';
part 'address.g.dart';

enum AddressType {
  delivery,
  billing,
}

@freezed
class Address with _$Address {
  const factory Address({
    @JsonKey(includeToJson: false) String? id,
    @JsonKey(includeToJson: false) required AddressType type,
    String? nip,
    required String name,
    required String street,
    required String postalCode,
    required String city,
    required String phone,
    required String email,
  }) = _Address;

  factory Address.fromJson(Map<String, Object?> json) =>
      _$AddressFromJson(json);
}
