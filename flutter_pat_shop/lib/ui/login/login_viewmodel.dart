import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter_pat_shop/data/UserRepoImple.dart';
import 'package:flutter_pat_shop/repo/UserRepo.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginViewModel extends Model {
  static LoginViewModel? _instance;

  static getInstance() {
    if (_instance == null) {
      _instance = LoginViewModel();
    }
    return _instance;
  }

  UserRepo userRepo = UserRepoImpl.getInstance();
  String? message;

  static void dispose() {
    _instance = null;
  }

  Future<bool> updateMessage(String userPhone, String userPass) async {
    var result = await userRepo.loginByPhoneNumber(
        userPhone, sha256.convert(utf8.encode(userPass)).toString());
        print(sha256.convert(utf8.encode(userPass)).toString());
    if (result == null) {
      message = "There was a problem, please try again!";
    } else if (!result) {
      message = "The username or password is incorrect, please try again!";
    } else {
      message = null;
    }
    notifyListeners();
    return result ?? false;
  }
}
