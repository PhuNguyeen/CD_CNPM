import 'dart:convert';
import 'dart:io';

import 'package:flutter_pat_shop/repo/UserRepo.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_pat_shop/model/user/user.dart';
import 'package:flutter_pat_shop/util/constants.dart';
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserAPI with UserRepo {
  static UserAPI? instance;

  static UserRepo getInstance() {
    if (instance == null) {
      instance = UserAPI();
    }
    return instance!;
  }

  Future<bool?> loginByPhoneNumber(String userPhone, String userPass) async {
    String url =
        "$LINK_API/user/login/${userPhone.trim()}?userPass=${userPass.trim()}";
    var response;
    try {
      response = await http.get(Uri.parse(url));
    } on Exception {
      print("Http exception");
      return null;
    }
    var json = jsonDecode(response.body);
    if (json['status']) {
      //Sửa mảng user trả về
      User user = User.fromJson(json['data'][0]);
      _saveInfoUserToCache(user: user);
      print(user.toString());
      return true;
    } else {
      print(json['data']);
      return false;
    }
  }

  /*
   * return null nếu lỗi kết nối
   * return true nếu sđt/gmail có thể được đang kí và ngược lại
   */

  Future<bool?> signUpByPhoneNumber(String userPhone) async {
    Uri apiLink =
        Uri.parse("$LINK_API/user/read_single_signup.php?userPhone=$userPhone");
    var response;
    try {
      response = await http.get(apiLink);
    } on Exception {
      print("Http error!");
      return null;
    }

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      if (json["message"]
          .toString()
          .toUpperCase()
          .contains("No User found".toUpperCase())) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }

  /*
   * return null nếu gặp lỗi server 
   * return true true nếu đăng kí thành công 
   */
  Future<bool?> createUser(Map<String, dynamic> data, File? fileAvatar) async {
    final apiLink = Uri.parse("$LINK_API/user/create.php");

    var request = http.MultipartRequest("POST", apiLink);
    request.fields['data'] = jsonEncode(data);

    if (fileAvatar != null) {
      var pic = await http.MultipartFile.fromPath("file", fileAvatar.path,
          contentType: new MediaType("image", "jpg"));
      request.files.add(pic);
      print(fileAvatar.path);
    }

    http.Response response;
    try {
      response = await http.Response.fromStream(await request.send());
    } on Exception {
      print("Http exception");
      return null;
    }

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      if (json['message']['create']
          .toString()
          .toUpperCase()
          .contains("Successful.".toUpperCase())) {
        return true;
      }
    }

    return false;
  }

  @override
  Future<void> deleteUserById(String id) {
    // TODO: implement deleteUserById
    throw UnimplementedError();
  }

  @override
  Future<void> updaterUserById(String userPass) {
    // TODO: implement updaterUserById
    throw UnimplementedError();
  }

  _saveInfoUserToCache({required User user}) async {
    final saveData = await SharedPreferences.getInstance();
    saveData.setBool(IS_LOGIN, true);
    saveData.setInt(USER_ID, user.userID);
    saveData.setString(USER_NAME, user.userName);
    saveData.setString(USER_AVATAR, user.userPhone);
    saveData.setString(USER_EMAIL, user.userEmail);
    saveData.setString(USER_AVATAR, user.userAvatar!);
    print("Saved to cache!");
  }
}
