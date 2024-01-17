import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';
part 'address.g.dart';

enum AddressType {
  delivery,
  payment,
}

@freezed
class Address with _$Address {
  const factory Address({
    @JsonKey(includeToJson: false) String? id,
    @JsonKey(includeToJson: false)
    @Default(AddressType.delivery)
    AddressType type,
    String? nip,
    required String name,
    required String street,
    required String postalCode,
    required String city,
    required String phone,
    required String email,
  }) = _Address;

  factory Address.empty(AddressType type) => Address(
        type: type,
        name: '',
        street: '',
        postalCode: '',
        city: '',
        phone: '',
        email: '',
      );

  factory Address.fromJson(Map<String, Object?> json) =>
      _$AddressFromJson(json);
}
