// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Cart _$$_CartFromJson(Map<String, dynamic> json) => _$_Cart(
      id: json['id'] as String?,
      userId: json['userId'] as String,
      state: $enumDecodeNullable(_$CartStateEnumMap, json['state']) ??
          CartState.active,
      shipping: (json['shipping'] as num?)?.toDouble() ?? 15.0,
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_CartToJson(_$_Cart instance) => <String, dynamic>{
      'userId': instance.userId,
      'state': _$CartStateEnumMap[instance.state]!,
      'shipping': instance.shipping,
      'items': instance.items.map((e) => e.toJson()).toList(),
    };

const _$CartStateEnumMap = {
  CartState.active: 'active',
  CartState.abandoned: 'abandoned',
};
