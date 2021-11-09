import 'package:json_annotation/json_annotation.dart';
part 'category.g.dart';

@JsonSerializable()
class Category {
  int categoryID;
  String categoryName;
  String categoryImage;

  Category({required this.categoryID, required this.categoryName, required this.categoryImage});
  
  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}