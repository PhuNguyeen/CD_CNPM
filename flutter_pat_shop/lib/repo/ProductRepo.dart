import 'package:flutter_pat_shop/model/product/product.dart';

abstract class ProductRepo {
  Future<List<Product>?> getRecomendedProduct(int start, int limit);

  Future<List<Product>?> getCategoryProduct(
      int page, int limit, int categoryID);

  Future<List<Product>?> getProductListByManufacturerID(int manufacturerID);

  Future<List<Product>?> findProductList(String content);

  void dispose();
}