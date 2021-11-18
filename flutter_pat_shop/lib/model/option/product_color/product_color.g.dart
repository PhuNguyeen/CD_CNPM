// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_color.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductColor _$ProductColorFromJson(Map<String, dynamic> json) {
  return ProductColor(
    colorID: json['colorID'] as int,
    colorName: json['colorName'] as String,
    price: json['price'] as int,
  );
}

Map<String, dynamic> _$ProductColorToJson(ProductColor instance) =>
    <String, dynamic>{
      'colorID': instance.colorID,
      'colorName': instance.colorName,
      'price': instance.price,
    };
