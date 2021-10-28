import 'dart:io';

abstract class UserRepo{
  Future<bool?> createUser(Map<String, dynamic> data, File? fileAvatar);

  Future<void> deleteUserById(String id);

  Future<bool?> loginByPhoneNumber(String userPhone, String userPass);

  Future<bool?> signUpByPhoneNumber(String userPhone);

  Future<void> updaterUserById(String userPass); 
}