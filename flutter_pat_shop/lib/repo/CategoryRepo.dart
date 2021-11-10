import 'package:flutter_pat_shop/model/category/category.dart';

abstract class CategoryRepo{
  Future<List<Category>> getAllCategory();
  dispose();
}