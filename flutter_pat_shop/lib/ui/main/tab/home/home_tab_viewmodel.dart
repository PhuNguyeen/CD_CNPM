import 'package:flutter_pat_shop/data/CategoryRepoImpl.dart';
import 'package:flutter_pat_shop/data/ProductRepoImpl.dart';
import 'package:flutter_pat_shop/model/category/category.dart';
import 'package:flutter_pat_shop/model/product/product.dart';
import 'package:flutter_pat_shop/repo/CategoryRepo.dart';
import 'package:flutter_pat_shop/repo/ProductRepo.dart';
import 'package:scoped_model/scoped_model.dart';

class HomeTabViewModel extends Model {
  static HomeTabViewModel? _instance;

  static getInstance() {
    if (_instance == null) {
      _instance = HomeTabViewModel();
    }
    return _instance;
  }

  ProductRepo productRepo = ProductRepoImpl.getInstance();
  CategoryRepo categoryRepo = CategoryRepoImpl.getInstance();

  List<Product> recomendedProductsList = [];
  List<Category> listCategory = [];
  bool isLoading = true;
  bool noProductFound = true;
  String? message;
  int page = 0;
  final _limit = 10;

  HomeTabViewModel() {
    updateListCategory();
    updateRecomendedProductsList();
  }

  updateRecomendedProductsList() async {
    isLoading = true;
    noProductFound= false;
    updateMessage("Loading...");
    var result = await productRepo.getRecomendedProduct(this.page, this._limit);
    Future.delayed(Duration(seconds: 1), () {
      if (result == null) {
        updateMessage("There was a problem, please try again!");
        isLoading = false;
        noProductFound = true;
      } else if (result.length == 0) {
        updateMessage("No other products found!");
        isLoading = false;
        noProductFound = true;
      } else {
        recomendedProductsList += result;
        this.page += 1;
        updateMessage(null);
        isLoading = false;
        noProductFound = false;
      }
    });
    notifyListeners();
  }

  updateIsLoading(bool isLoading) {
    this.isLoading = isLoading;
    notifyListeners();
  }

  updateMessage(String? message) {
    this.message = message;
    notifyListeners();
  }

  updateNoProductFound(bool noProductFound) {
    this.noProductFound = noProductFound;
  }

  updateListCategory() async {
    listCategory = await categoryRepo.getAllCategory();
    notifyListeners();
  }

  dispose() {
    categoryRepo.dispose();
    productRepo.dispose();

    _instance = null;
  }
}
