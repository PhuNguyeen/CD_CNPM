import 'package:flutter_pat_shop/data/ProductRepoImpl.dart';
import 'package:flutter_pat_shop/model/product/product.dart';
import 'package:flutter_pat_shop/repo/ProductRepo.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scoped_model/scoped_model.dart';

class SearchViewModel extends Model{
  static SearchViewModel? _instance;
  
  static getInstance(){
    if(_instance == null){
      _instance = SearchViewModel();
    }
    return _instance;
  }

  ProductRepo productRepo = ProductRepoImpl.getInstance();

  List<Product> productsList = [];
  String contentSearching = "";
  String contentSearched = "";

  updateContentSearch(String content){
    contentSearching = content;
    notifyListeners();
  }

  searchProduct()async{
    contentSearched = contentSearching;
    var result = await productRepo.findProductList(contentSearched);

    if(result == null){
      productsList = [];
      Fluttertoast.showToast(msg: "There was a problem, please try again!");
    }else {
      productsList = result;
    }
    notifyListeners();
  }

  dispose(){
    _instance = null;
  }
}