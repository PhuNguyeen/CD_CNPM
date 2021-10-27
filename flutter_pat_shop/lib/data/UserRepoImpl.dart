import 'dart:io';

import 'package:flutter_pat_shop/data/remote/UserApi.dart';
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
  Future<void> createUser(Map<String, dynamic> data, File? fileAvatar) async {
    bool createSuccessful = await userAPI.createUser(data, fileAvatar);
    if(createSuccessful){
      User user = User.fromJson(data);
      _saveInfoUserToCache(user: user);
    }else{
      print("Create user fail!");
    }
  }

  @override
  Future<void> deleteUserById(String id) {
    // TODO: implement deleteUserById
    throw UnimplementedError();
  }

  @override
  Future<User?> loginByPhoneNumber(String userPhone, String userPass) async {
    User? user = await userAPI.loginByPhoneNumber(userPhone, userPass);
    if (user != null) {
      _saveInfoUserToCache(user: user);
      print("Saved data to cache!");
      return user;
    }

    return null;
  }

  @override
  Future<bool> signUpByPhoneNumber(String userPhone) async {
    bool isExistUser = await userAPI.signUpByPhoneNumber(userPhone);
    return isExistUser;
  }

  @override
  Future<void> updaterUserById(String id) {
    // TODO: implement updaterUserById
    throw UnimplementedError();
  }

  _saveInfoUserToCache({required User user}) async {
    final saveData = await SharedPreferences.getInstance();
    saveData.setBool(IS_LOGIN, true);
    saveData.setString(USER_ID, user.userID);
    saveData.setString(USER_NAME, user.userName);
    saveData.setString(USER_AVATAR, user.userPhone);
    saveData.setString(USER_EMAIL, user.userEmail);
    saveData.setString(USER_AVATAR, user.userAvatar);
    print("Saved to cache!");
  }
}
