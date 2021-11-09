import 'package:scoped_model/scoped_model.dart';

class CartTabViewModel extends Model{
  static CartTabViewModel? _instance ;

  static getInstance(){
    if(_instance == null){
      _instance = CartTabViewModel();
    }
    return _instance;
  }
}