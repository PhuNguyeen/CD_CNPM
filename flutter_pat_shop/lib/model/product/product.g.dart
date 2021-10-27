// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    productID: json['productID'] as String,
    productName: json['productName'] as String,
    productImage: json['productImage'] as String,
    productPrice: json['productPrice'] as String?,
    categoryID: json['categoryID'] as String,
    manufacturerID: json['manufacturerID'] as String,
  );
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'productID': instance.productID,
      'productName': instance.productName,
      'productImage': instance.productImage,
      'productPrice': instance.productPrice,
      'categoryID': instance.categoryID,
      'manufacturerID': instance.manufacturerID,
    };
