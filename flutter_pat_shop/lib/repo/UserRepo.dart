import 'dart:io';

abstract class UserRepo{
  Future<bool?> createUser(Map<String, dynamic> data);

  Future<void> deleteUserById(String id);

  Future<bool?> loginByPhoneNumber(String userPhone, String userPass);

  Future<bool?> signUpByPhoneNumber(String userPhone);

  Future<void> updateUserById(String userPass); 

  Future<void> updateAvatar(File file, String userPhone);

  dispose();
}