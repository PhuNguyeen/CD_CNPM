import 'package:flutter_pat_shop/data/ProductRepoImpl.dart';
import 'package:flutter_pat_shop/model/product/product.dart';
import 'package:flutter_pat_shop/repo/ProductRepo.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductListByIdCategoryViewModel extends Model {
  static ProductListByIdCategoryViewModel? _instance;
  final int idCategory;

  static ProductListByIdCategoryViewModel getInstance(int idCategory) {
    if (_instance == null) {
      _instance = ProductListByIdCategoryViewModel(idCategory);
    }
    return _instance!;
  }

  ProductRepo productRepo = ProductRepoImpl();

  List<Product> products = [];
  bool isLoading = true;
  bool noProductFound = true;
  String? message;
  int page = 1;
  final _limit = 5;

  ProductListByIdCategoryViewModel(this.idCategory) {
    updateProducts();
  }

  updateProducts() async {
    isLoading = true;
    noProductFound = false;
    updateMessage("Loading...");
    var result = await productRepo.getCategoryProduct(page, _limit, idCategory);
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
        products += result;
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

  dispose(){
    _instance = null;
  }
}
