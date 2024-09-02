import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  final int? id;
  final String? image;
  final double? price;
  final double? value;
  final String? name;
  final String? gid;

  Product({
    this.name,
    this.price,
    this.value,
    this.image,
    this.gid,
    this.id,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
