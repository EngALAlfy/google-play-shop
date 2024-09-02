// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      price: (json['price'] as num?)?.toDouble(),
      product_name: (json['product_name'] as num?)?.toDouble(),
      product_value: json['product_value'] as String?,
      id: (json['id'] as num?)?.toInt(),
      product_gid: json['product_gid'] as String?,
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'product_name': instance.product_name,
      'product_value': instance.product_value,
      'product_gid': instance.product_gid,
    };
