import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/until/constants.dart';
import 'package:flutter_pat_shop/model/user.dart';
import 'package:flutter_pat_shop/screens/home/home_screen.dart';
import 'package:flutter_pat_shop/screens/register/register_screen.dart';
import 'package:flutter_pat_shop/widgets/already_have_an_account.dart';
import 'package:flutter_pat_shop/widgets/rounded_button.dart';
import 'package:flutter_pat_shop/widgets/rounded_password_field.dart';
import 'package:flutter_pat_shop/widgets/rounded_phone_field.dart';
import 'package:http/http.dart' as http;
import 'package:phone_form_field/phone_form_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../until/validation.dart';
import 'background_login.dart';

class BodyLogin extends StatefulWidget {
  BodyLogin({Key? key}) : super(key: key);

  @override
  _BodyLoginState createState() => _BodyLoginState();
}

class _BodyLoginState extends State<BodyLogin> {
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
      child: BackgroundLogin(
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
          RoundedPhoneField(
            textInputType: TextInputType.phone,
            hintText: "123XXXX89",
            onChanged: (value) {
              setState(() {
                PhoneNumber pn = value;
                phoneNumber = pn.international.substring(1);
                print(pn.international.substring(1));
              });
            },
            errorText: Validation.validateMobile(phoneNumber),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          RoundedPasswordField(
            onChanged: (value) {
              setState(() {
                password = value;
                if (phoneNumber.isNotEmpty && password.isNotEmpty) {
                  filledAll = true;
                } else {
                  filledAll = false;
                }
              });
            }, hintText: "Password",
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
        "user/screens.login.php?userPhone=${phoneNumber.trim()}&userPass=${password.trim()}";
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
