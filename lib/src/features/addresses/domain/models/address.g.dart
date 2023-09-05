// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Address _$$_AddressFromJson(Map<String, dynamic> json) => _$_Address(
      id: json['id'] as String?,
      type: $enumDecode(_$AddressTypeEnumMap, json['type']),
      nip: json['nip'] as String?,
      name: json['name'] as String,
      street: json['street'] as String,
      postalCode: json['postalCode'] as String,
      city: json['city'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$$_AddressToJson(_$_Address instance) =>
    <String, dynamic>{
      'nip': instance.nip,
      'name': instance.name,
      'street': instance.street,
      'postalCode': instance.postalCode,
      'city': instance.city,
      'phone': instance.phone,
      'email': instance.email,
    };

const _$AddressTypeEnumMap = {
  AddressType.delivery: 'delivery',
  AddressType.billing: 'billing',
};
