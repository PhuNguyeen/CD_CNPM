import 'dart:io';

import 'package:flutter_pat_shop/data/remote/UserAPI.dart';
import 'package:flutter_pat_shop/model/user/user.dart';
import 'package:flutter_pat_shop/repo/UserRepo.dart';
import 'package:flutter_pat_shop/util/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepoImpl with UserRepo {
  static UserRepo? instance;

  static UserRepo getInstance() {
    if (instance == null) {
      instance = UserRepoImpl();
    }
    return instance!;
  }

  UserAPI userAPI = UserAPI();

  @override
  void dispose() {
    instance = null;
    throw UnimplementedError();
  }

  @override
  Future<bool?> createUser(Map<String, dynamic> data) async {
    return await userAPI.createUser(data);
  }

  @override
  Future<void> deleteUserById(String id) {
    // TODO: implement deleteUserById
    throw UnimplementedError();
  }

  @override
  Future<bool?> loginByPhoneNumber(String userPhone, String userPass) async {
    Map<User?, bool>? res =
        await userAPI.loginByPhoneNumber(userPhone, userPass);
    if (res == null) {
      return null;
    } else {
      if (res.values.first) {
        _saveInfoUserToCache(user: res.keys.first!);
        return true;
      } else {
        return false;
      }
    }
  }

  @override
  Future<bool?> signUpByPhoneNumber(String userPhone) {
    return userAPI.signUpByPhoneNumber(userPhone);
  }

  @override
  Future<void> updateUserById(String userPass) {
    // TODO: implement updaterUserById
    throw UnimplementedError();
  }

  _saveInfoUserToCache({required User user}) async {
    final saveData = await SharedPreferences.getInstance();
    saveData.setBool(IS_LOGIN, true);
    saveData.setInt(USER_ID, user.userID);
    saveData.setString(USER_NAME, user.userName);
    saveData.setString(USER_AVATAR, user.userPhone);
    if (user.userEmail != null) {
      saveData.setString(USER_EMAIL, user.userEmail!);
    }
    saveData.setString(USER_AVATAR, user.userAvatar!);
    print("Saved to cache!");
  }

  @override
  Future<void> updateAvatar(File file, String userPhone) async {
    bool? result = await userAPI.updateAvatar(file, userPhone);
    if (result == null) {
      print("Error http upload avatar");
    } else if (result == false) {
      print("Error upload avatar");
    } else {
      print("Upload Avatar OK");
    }
  }
}
