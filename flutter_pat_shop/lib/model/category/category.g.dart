// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category(
    categoryID: json['categoryID'] as String,
    categoryName: json['categoryName'] as String,
    categoryAvatar: json['categoryAvatar'] as String,
  );
}

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'categoryID': instance.categoryID,
      'categoryName': instance.categoryName,
      'categoryAvatar': instance.categoryAvatar,
    };
