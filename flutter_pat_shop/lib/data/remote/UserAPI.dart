import 'dart:convert';
import 'dart:io';

import 'package:flutter_pat_shop/ui/login/login_viewmodel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_pat_shop/model/user/user.dart';
import 'package:flutter_pat_shop/util/constants.dart';
import 'package:http_parser/http_parser.dart';

class UserAPI {
  Future<User?> loginByPhoneNumber(String userPhone, String userPass) async {
    String url =
        "$LINK_API/user/read_single_login.php?userPhone=${userPhone.trim()}&userPass=${userPass.trim()}";
    var response;
    try {
      response = await http.get(Uri.parse(url));
    } on Exception {
      print("Http exception");
      return null;
    }
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      if (json['message']
          .toString()
          .toUpperCase()
          .contains("Have data".toUpperCase())) {
        User user = User.fromJson(json['data']);
        print(user.toString());
        return user;
      } else {
        LoginViewModel loginViewModel = LoginViewModel.getInstance();
        loginViewModel.incorrecet = false;
        print(json['message']);
        return null;
      }
    }
  }

  Future<bool> signUpByPhoneNumber(String userPhone) async {
    Uri apiLink =
        Uri.parse("$LINK_API/user/read_single_signup.php?userPhone=$userPhone");
    final response = await http.get(apiLink);
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

  Future<bool> createUser(Map<String, dynamic> data, File? fileAvatar) async {
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
      return false;
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
}
