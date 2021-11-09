import 'package:flutter_pat_shop/data/remote/ProductAPI.dart';
import 'package:flutter_pat_shop/model/product/product.dart';
import 'package:scoped_model/scoped_model.dart';

class HomeTabViewModel extends Model {
  static HomeTabViewModel? _instance;

  static getInstance() {
    if (_instance == null) {
      _instance = HomeTabViewModel();
    }
    return _instance;
  }

  ProductAPI productAPI = ProductAPI();
  List<Product> recomendedProductsList = [];
  bool isLoading = true;
  bool noProductFound = true;
  String? message;
  int page = 0;
  final _limit = 5;

  HomeTabViewModel() {
    updateRecomendedProductsList();
  }

  updateRecomendedProductsList() async {
    updateIsLoading(true);
    updateNoProductFound(false);
    updateMessage("Loading...");
    var result = await productAPI.getRecomendedProduct(this.page, this._limit);
    Future.delayed(Duration(seconds: 2), () {
      if (result == null) {
        updateMessage("There was a problem, please try again!");
        updateIsLoading(false);
        updateNoProductFound(true);
      } else if (result.length == 0) {
        updateMessage("No other products found!");
        updateIsLoading(false);
        updateNoProductFound(true);
      } else {
        recomendedProductsList += result;
        this.page += 1;
        updateMessage(null);
        updateIsLoading(false);
        updateNoProductFound(false);
      }
    });
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
}
