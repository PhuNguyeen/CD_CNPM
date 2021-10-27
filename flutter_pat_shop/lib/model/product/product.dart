import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';
@JsonSerializable()
class Product {
  String productID;
  String productName;
  String productImage;
  String? productPrice;
  String categoryID;
  String manufacturerID;

  Product(
      {required this.productID,
      required this.productName,
      required this.productImage,
      required this.productPrice,
      required this.categoryID,
      required this.manufacturerID,});
      factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
