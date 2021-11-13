import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flutter_pat_shop/data/UserRepoImple.dart';
import 'package:flutter_pat_shop/repo/UserRepo.dart';
import 'package:flutter_pat_shop/util/validation.dart';
import 'package:scoped_model/scoped_model.dart';

class EnterInfoUserViewModel extends Model {
  static EnterInfoUserViewModel? _instance;

  static getInstace() {
    if (_instance == null) {
      _instance = EnterInfoUserViewModel();
    }
    return _instance;
  }

  UserRepo userRepo = UserRepoImpl();

  String? userName;
  String? userPass;
  String? userConfPass;
  File? image;
  String? message;
  bool isValidateAll = false;
  /*
   * nếu sđt chưa tồn tại thì trả về true & ngược lại
   */
  Future<bool> createUser(String userPhone) async {
    final result = await userRepo.createUser({
      "userName": userName,
      "userPhone": userPhone,
      "userPass": sha256.convert(utf8.encode(userPass!)).toString(),
    });
    if (result == null) {
      message = "There was a problem, please try again!";
    } else if (!result) {
      message = "Create account error!";
    } else {
      message = null;
    }
    notifyListeners();
    return result ?? false;
  }

  void updateAvatar(String userPhone) {
    userRepo.updateAvatar(image!, userPhone);
  }

  void updateUserName(String userName) {
    this.userName = userName;
    updateIsValidateAll();
  }

  void updateUserPass(String userPass) {
    this.userPass = userPass;
    updateIsValidateAll();
  }

  void updateUserConfPass(String userConfPass) {
    this.userConfPass = userConfPass;
    updateIsValidateAll();
  }

  void updateFileAvatar(File? file) {
    if (file != null) {
      this.image = file;
      print(file.path);
      notifyListeners();
    }
  }

  void updateIsValidateAll() {
    if (userName == null || userPass == null || userConfPass == null) {
      isValidateAll = false;
    } else {
      if (Validation.validateName(userName!) != null ||
          Validation.validatePassword(userPass!) != null ||
          Validation.validateConfirmPassword(userPass!, userConfPass!) !=
              null) {
        isValidateAll = false;
      } else {
        isValidateAll = true;
      }
    }
    notifyListeners();
  }
}
