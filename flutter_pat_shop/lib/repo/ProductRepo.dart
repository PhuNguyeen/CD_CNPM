import 'package:flutter_pat_shop/model/product/product.dart';

abstract class ProductRepo {
  Future<List<Product>?> getRecomendedProduct(int start, int limit);

  Future<List<Product>?> getCategoryProduct(
      int page, int limit, int idCategory);

  Future<String?> getDescriptionProduct(int idProduct);

  Future<List<Product>?> getInformationProduct(int idProduct);

  void dispose();
}
