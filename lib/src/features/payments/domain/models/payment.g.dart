// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentImpl _$$PaymentImplFromJson(Map<String, dynamic> json) =>
    _$PaymentImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      type: $enumDecode(_$PaymentTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$PaymentImplToJson(_$PaymentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'type': _$PaymentTypeEnumMap[instance.type]!,
    };

const _$PaymentTypeEnumMap = {
  PaymentType.wireTransfer: 'wireTransfer',
  PaymentType.cod: 'cod',
  PaymentType.creditCard: 'creditCard',
  PaymentType.online: 'online',
};
