// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    productID: json['productID'] as int,
    productName: json['productName'] as String,
    productImage: json['productImage'] as int,
    productPrice: json['productPrice'] as int?,
    manufacturerName: json['manufacturerName'] as String,
    countUser: json['countUser'] as int,
    sumRate: json['sumRate'] as String,
    countProductBill: json['countProductBill'] as String,
  );
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'productID': instance.productID,
      'productName': instance.productName,
      'productImage': instance.productImage,
      'productPrice': instance.productPrice,
      'manufacturerName': instance.manufacturerName,
      'countUser': instance.countUser,
      'sumRate': instance.sumRate,
      'countProductBill': instance.countProductBill,
    };
