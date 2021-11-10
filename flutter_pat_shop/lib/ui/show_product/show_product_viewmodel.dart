import 'package:flutter_pat_shop/data/ProductRepoImpl.dart';
import 'package:flutter_pat_shop/repo/ProductRepo.dart';
import 'package:scoped_model/scoped_model.dart';

class ShowProductViewModel extends Model{
  static ShowProductViewModel? _instance;

  static getInstance(){
    if(_instance == null){
      _instance = ShowProductViewModel();
    }
    return _instance;
  }

  ProductRepo productRepo = ProductRepoImpl.getInstance();
  bool isLike = false;

  void updateIsLike(){
    isLike = !isLike;
    notifyListeners();
  }

  void dispose() {
    productRepo.dispose();
    _instance = null;
  }
}