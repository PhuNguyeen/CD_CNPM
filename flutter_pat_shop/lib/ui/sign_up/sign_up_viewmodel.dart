import 'package:flutter_pat_shop/data/UserRepoImpl.dart';
import 'package:flutter_pat_shop/repo/UserRepo.dart';
import 'package:scoped_model/scoped_model.dart';

class SignUpViewModel extends Model {
  static SignUpViewModel? _instance;

  static getInstace(){
    if(_instance == null){
      _instance = SignUpViewModel();
    }
    return _instance;
  }

  UserRepo userRepo = UserRepoImpl();
  bool userExist = false;
  
  SignUpViewModel(){
    notifyListeners();
  }

  void signUp(String userPhone) async{
    userExist = await userRepo.signUpByPhoneNumber(userPhone);
    notifyListeners();
  }
}
