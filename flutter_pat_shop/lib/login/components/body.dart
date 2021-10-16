import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/constants.dart';
import 'package:flutter_pat_shop/home/home_screen.dart';
import 'package:flutter_pat_shop/login/validation_login.dart';
import 'package:flutter_pat_shop/model/user.dart';
import 'package:flutter_pat_shop/register/register_screen.dart';
import 'package:flutter_pat_shop/widgets/already_have_an_account.dart';
import 'package:flutter_pat_shop/widgets/rounded_button.dart';
import 'package:flutter_pat_shop/widgets/rounded_input_field.dart';
import 'package:flutter_pat_shop/widgets/rounded_password_field.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'background.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var phoneNumber = "";
  var password = "";
  bool filledAll = false;
  bool verified = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Background(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/logo_app.png",
            height: size.height * 0.35,
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          RoundedInputField(
            textInputType: TextInputType.phone,
            hintText: "0123XXXX89",
            onChanged: (value) {
              setState(() {
                phoneNumber = value;
                if (phoneNumber.isNotEmpty && password.isNotEmpty) {
                  filledAll = true;
                } else {
                  filledAll = false;
                }
              });
            },
            errorText: ValidationLogin.validateMobile(phoneNumber),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          RoundedPasswordField(
            onChange: (value) {
              setState(() {
                password = value;
                if (phoneNumber.isNotEmpty && password.isNotEmpty) {
                  filledAll = true;
                } else {
                  filledAll = false;
                }
              });
            },
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          RoundedButton(
            press: filledAll
                ? () {
                    getDataUser();
                  }
                : null,
            text: "Login",
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return RegisterScreen();
                },
              ));
            },
          )
        ],
      )),
    );
  }

  void getDataUser() async {
    String url = LINK_API +
        "user/login.php?userPhone=${phoneNumber.trim()}&userPass=${password.trim()}";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      try {
        var jsonData = jsonDecode(response.body);
        if (jsonData['message'] == "No User found.") {
          print("No user");
        } else {
          print("there is user");
          User user = User(
            jsonData['userID'],
            jsonData['userName'],
            jsonData['userPhone'],
            jsonData['userPass'],
            jsonData['userEmail'],
            jsonData['userAvatar'],
            jsonData['userRole'],
          );

          setState(() {
            _saveInfoUser(user: user);
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => HomeScreen(),
              ),
              (route) => false,
            );
          });
        }
        print("${jsonData.toString()}");
      } catch (_) {}
    } else {
      print("Fail");
    }
  }

  _saveInfoUser({required User user}) async {
    final saveData = await SharedPreferences.getInstance();
    saveData.setBool(IS_LOGIN, true);
    saveData.setString(USER_NAME, user.userName);
    saveData.setString(USER_PHONE, user.userPhone);
    saveData.setString(USER_EMAIL, user.userEmail);
    saveData.setString(USER_AVATAR, user.userAvatar);
    print("Saved data");
  }
}
