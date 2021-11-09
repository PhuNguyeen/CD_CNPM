import 'package:flutter_pat_shop/data/remote/ProductAPI.dart';
import 'package:scoped_model/scoped_model.dart';

class ShowProductViewModel extends Model{
  static ShowProductViewModel? _instance;

  static getInstance(){
    if(_instance == null){
      _instance = ShowProductViewModel();
    }
    return _instance;
  }

  ProductAPI productAPI = ProductAPI();
  bool isLike = false;

  void updateIsLike(){
    isLike = !isLike;
    notifyListeners();
  }

  void dispose() {
    _instance = null;
  }
}