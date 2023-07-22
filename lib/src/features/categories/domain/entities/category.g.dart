// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Category _$$_CategoryFromJson(Map<String, dynamic> json) => _$_Category(
      id: json['id'] as String,
      name: json['name'] as String,
      thumbnail: json['thumbnail'] as String,
      featured: json['featured'] as bool? ?? false,
    );

Map<String, dynamic> _$$_CategoryToJson(_$_Category instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'thumbnail': instance.thumbnail,
      'featured': instance.featured,
    };
