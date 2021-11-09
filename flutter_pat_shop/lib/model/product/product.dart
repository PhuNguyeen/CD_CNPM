import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  int productID;
  String productName;
  int productImage;
  int? productPrice;
  String manufacturerName;
  int countUser;
  String sumRate;
  String countProductBill;

  Product({
    required this.productID,
    required this.productName,
    required this.productImage,
    this.productPrice,
    required this.manufacturerName,
    required this.countUser,
    required this.sumRate,
    required this.countProductBill,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
