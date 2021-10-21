import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/model/user.dart';
import 'package:flutter_pat_shop/screens/enter_info_user/components/background_enter_info_user.dart';
import 'package:flutter_pat_shop/until/constants.dart';
import 'package:flutter_pat_shop/until/validation.dart';
import 'package:flutter_pat_shop/widgets/profile_widget.dart';
import 'package:flutter_pat_shop/widgets/rounded_button.dart';
import 'package:flutter_pat_shop/widgets/rounded_input_field.dart';
import 'package:flutter_pat_shop/widgets/rounded_password_field.dart';
import 'package:http/http.dart' as http;

class BodyEnterInfoUser extends StatefulWidget {
  final String phoneNumber;

  BodyEnterInfoUser({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  _BodyEnterInfoUserState createState() => _BodyEnterInfoUserState();
}

class _BodyEnterInfoUserState extends State<BodyEnterInfoUser> {
  late User _user;
  String? userName;
  String? userPass;
  String? userConfPass;

  @override
  void initState() {
    _user = User("", "", widget.phoneNumber, "", "", "", "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BackgroundEnterInfoUser(
      child: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 32, horizontal: 32),
        children: [
          ProfileWidget(
            imagePath: LINK_IMAGE_TEST + _user.userAvatar,
            onClicked: () async {
              print(_user.userPhone);
            },
            icon: Icon(
              Icons.edit,
              color: Colors.white,
              size: 20,
            ),
          ),
          SizedBox(
            height: size.height * 0.1,
          ),
          RoundedInputField(
            hintText: "Your name",
            onChanged: (value) {
              setState(() {
                userName = value.toString();
              });
            },
            icon: Icon(Icons.person),
            errorText:
                userName == null ? null : Validation.validateName(userName!),
          ),
          const SizedBox(
            height: 6,
          ),
          RoundedPasswordField(
            hintText: "Password",
            onChanged: (value) {
              setState(() {
                userPass = value.toString();
              });
            },
            errorText: userPass == null
                ? null
                : Validation.validatePassword(userPass!),
          ),
          const SizedBox(
            height: 6,
          ),
          RoundedPasswordField(
            hintText: "Confirm Password",
            onChanged: (value) {
              setState(() {
                userConfPass = value.toString();
              });
            },
            errorText: userConfPass == null
                ? null
                : Validation.validateConfirmPassword(userPass!, userConfPass!),
          ),
          const SizedBox(
            height: 6,
          ),
          RoundedButton(
            text: "Save",
            press: isValidateAll()
                ? () {
                    Map<String, dynamic> jsonData = _user.toJson();
                    createUser(jsonData);
                    // print(_user.toJson());
                  }
                : null,
          ),
        ],
      ),
    );
  }

  bool isValidateAll() {
    if (userName == null || userPass == null || userConfPass == null) {
      return false;
    } else {
      if (Validation.validateName(userName!) != null ||
          Validation.validatePassword(userPass!) != null ||
          Validation.validateConfirmPassword(userPass!, userConfPass!) !=
              null) {
        return false;
      }
    }
    return true;
  }

  createUser(Map<String, dynamic> jsonData) async {
    String apiLink = LINK_API + "user/create.php";
    final response = await http.post(Uri.parse(apiLink),
        body: jsonEncode(jsonData));
    if (response.statusCode == 200) {
      try {
        var json = jsonDecode(response.body);
        snackBar(json['message']);
        print(json['message']);
      } catch (_) {}
    } else {
      print("eeeeeeeeee");
    }
  }

  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
