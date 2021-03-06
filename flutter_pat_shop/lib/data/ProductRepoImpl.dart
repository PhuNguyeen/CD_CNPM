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
  Future<List<Product>?> getRecomendedProduct(int page, int limit) async {
    List<Product>? listProduct = await productAPI.getRecomendedProduct(page, limit);
    return listProduct;
  }

  @override
  Future<List<Product>?> getCategoryProduct(int page, int limit, int idCategory) async{
     List<Product>? listProduct = await productAPI.getCategoryProduct(page, limit, idCategory);
    return listProduct;
  }

  @override
  void dispose() {
    instance = null;
  }

  @override
  Future<List<Product>?> getProductListByManufacturerID(int manufacturerID) async{
    return await productAPI.getProductListByManufacturerID(manufacturerID);
  }

  @override
  Future<List<Product>?> findProductList(String content) async{
    return await productAPI.findProductList(content);
  }
  
}