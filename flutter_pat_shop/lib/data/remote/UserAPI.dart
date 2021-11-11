import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter_pat_shop/model/user/user.dart';
import 'package:flutter_pat_shop/util/constants.dart';
import 'package:http_parser/http_parser.dart';

class UserAPI {
  Future<Map<User?, bool>?> loginByPhoneNumber(
      String userPhone, String userPass) async {
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
      print(user.toString());
      return {user: true};
    } else {
      print(json['data']);
      return {null: false};
    }
  }

  /*
   * return null nếu lỗi kết nối
   * return true nếu sđt/gmail có thể được đang kí và ngược lại
   */

  Future<bool?> signUpByPhoneNumber(String userPhone) async {
    Uri apiLink =
        Uri.parse("$LINK_API/user/signUp/$userPhone");
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
  Future<bool?> createUser(Map<String, dynamic> data) async {
    final apiLink = Uri.parse("$LINK_API/user");

    var response;

    try {
      response = await http.post(apiLink, body: data);
    } on Exception {
      print("Http error!");
      return null;
    }

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      return jsonData['status'];
    }
    return null;
  }

  Future<void> deleteUserById(String id) {
    // TODO: implement deleteUserById
    throw UnimplementedError();
  }

  Future<void> updaterUserById(String userPass) {
    // TODO: implement updaterUserById
    throw UnimplementedError();
  }

  Future<bool?> updateAvatar(File file, String userPhone) async {
    final apiLink = Uri.parse("$LINK_API/user/avatar/$userPhone");
    var request = http.MultipartRequest("POST", apiLink);

      var pic = await http.MultipartFile.fromPath("file", file.path,
          contentType: new MediaType("image", "jpg"));
      request.files.add(pic);

    http.Response response;

    try {
      response = await http.Response.fromStream(await request.send());
    } on Exception {
      print("Http exception");
      return null;
    }

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      if (json['message']
          .toString()
          .toUpperCase()
          .contains("Successful.".toUpperCase())) {
        return true;
      }else{
        return false;
      }
    }
  }
}
