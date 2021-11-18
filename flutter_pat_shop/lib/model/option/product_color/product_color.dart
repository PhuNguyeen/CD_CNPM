import 'package:json_annotation/json_annotation.dart';

part 'product_color.g.dart';

@JsonSerializable()
class ProductColor {
  int colorID;
  String colorName;
  int price;
  ProductColor({
    required this.colorID,
    required this.colorName,
    required this.price,
  });
  factory ProductColor.fromJson(Map<String, dynamic> json) => _$ProductColorFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ProductColorToJson(this);

  @override
  String toString() => 'ProductColor(colorID: $colorID, colorName: $colorName, price: $price)';
}

