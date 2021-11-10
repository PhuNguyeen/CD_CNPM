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

  @override
  Future<List<Product>?> getCategoryProduct(int page, int limit, int idCategory) {
    // TODO: implement getCategoryProduct
    throw UnimplementedError();
  }

  @override
  Future<String?> getDescriptionProduct(int idProduct) async{
    // TODO: implement getDescriptionProduct
    throw UnimplementedError();
  }

  @override
  Future<List<Product>?> getInformationProduct(int idProduct) async{
    // TODO: implement getInformationProduct
    throw UnimplementedError();
  }

  @override
  void dispose() {
    instance = null;
  }
  
}