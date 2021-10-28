import 'dart:io';

import 'package:flutter_pat_shop/data/remote/UserAPI.dart';
import 'package:flutter_pat_shop/repo/UserRepo.dart';
import 'package:scoped_model/scoped_model.dart';

class EnterInfoUserViewModel extends Model {
  static EnterInfoUserViewModel? _instance;

  static getInstace() {
    if (_instance == null) {
      _instance = EnterInfoUserViewModel();
    }
    return _instance;
  }

  UserRepo userRepo = UserAPI();
  String? message;

  /*
   * nếu sđt chưa tồn tại thì trả về true & ngược lại
   */
  Future<bool> updateMessage(Map<String, dynamic> data, File? fileAvatar) async {
    final result = await userRepo.createUser(data, fileAvatar);
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
}
