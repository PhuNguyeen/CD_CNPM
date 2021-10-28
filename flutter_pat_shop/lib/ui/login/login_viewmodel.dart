import 'package:flutter/cupertino.dart';
import 'package:flutter_pat_shop/data/UserRepoImpl.dart';
import 'package:flutter_pat_shop/model/user/user.dart';
import 'package:flutter_pat_shop/repo/UserRepo.dart';
import 'package:flutter_pat_shop/util/constants.dart';
import 'package:flutter_pat_shop/util/my_snack_bar.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel extends Model {
  static LoginViewModel? _instance;

  static getInstance() {
    if (_instance == null) {
      _instance = LoginViewModel();
    }
    return _instance;
  }

  UserRepo userRepo = UserRepoImpl();
  bool isLogin = false;
  User? user;
  bool incorrecet = true;

  static void destroyInstance() {
    _instance = null;
  }

  LoginViewModel() {
    updateLogin();
  }

  void updateLogin() async {
    var sharePref = await SharedPreferences.getInstance();
    isLogin = sharePref.getBool(IS_LOGIN) ?? false;
    notifyListeners();
  }

  void loginByPhoneNumber(String userPhone, String userPass, BuildContext context) async {
    user = await userRepo.loginByPhoneNumber(userPhone, userPass);
    updateLogin();
    MySnackBar.snackBar(
        isLogin ? "Login Successful" : "Login Error!", context);
  }
}
