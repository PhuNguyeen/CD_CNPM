import 'package:flutter_pat_shop/model/product/product.dart';

abstract class ProductRepo{
  Future<List<Product>?> getRecomendedProduct(int start, int limit);
}