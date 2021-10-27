import 'dart:io';

import 'package:flutter_pat_shop/model/user/user.dart';

abstract class UserRepo{
  Future<void> createUser(Map<String, dynamic> data, File? fileAvatar);

  Future<void> deleteUserById(String id);

  Future<User?> loginByPhoneNumber(String userPhone, String userPass);

  Future<bool> signUpByPhoneNumber(String userPhone);

  Future<void> updaterUserById(String userPass); 
}