import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
  final int? id;
  final double? price;
  final double? product_name;
  final String? product_value;
  final String? product_gid;

  Order({
    this.price,
    this.product_name,
    this.product_value,
    this.id,
    this.product_gid,
  });

  factory Order.fromJson(Map<String, dynamic> json) =>
      _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
