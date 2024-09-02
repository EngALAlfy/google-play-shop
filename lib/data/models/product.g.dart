// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      value: (json['value'] as num?)?.toDouble(),
      image: json['image'] as String?,
      gid: json['gid'] as String?,
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'price': instance.price,
      'value': instance.value,
      'name': instance.name,
      'gid': instance.gid,
    };
