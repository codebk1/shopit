// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carrier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CarrierImpl _$$CarrierImplFromJson(Map<String, dynamic> json) =>
    _$CarrierImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      type: $enumDecode(_$CarrierTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$CarrierImplToJson(_$CarrierImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'type': _$CarrierTypeEnumMap[instance.type]!,
    };

const _$CarrierTypeEnumMap = {
  CarrierType.selfPickup: 'selfPickup',
  CarrierType.courier: 'courier',
  CarrierType.parcelLocker: 'parcelLocker',
};
