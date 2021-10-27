import 'package:flutter_pat_shop/data/remote/ProductAPI.dart';
import 'package:flutter_pat_shop/model/product/product.dart';
import 'package:flutter_pat_shop/repo/ProductRepo.dart';

class ProductRepoImpl with ProductRepo{
  
  static ProductRepo? instance;

  static ProductRepo getInstance(){
    if(instance == null){
      instance = ProductRepoImpl();
    }
    return instance!;
  } 
  
  ProductAPI productAPI = ProductAPI();

  @override
  Future<List<Product>?> getRecomendedProduct(int start, int limit) async {
    List<Product>? listProduct = await productAPI.getRecomendedProduct(start, limit);
    return listProduct;
  }

}