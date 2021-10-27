import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/model/user/user.dart';
import 'package:flutter_pat_shop/ui/main/main_application.dart';
import 'package:flutter_pat_shop/ui/register/register_screen.dart';
import 'package:flutter_pat_shop/util/constants.dart';
import 'package:flutter_pat_shop/util/my_snack_bar.dart';
import 'package:flutter_pat_shop/util/show_dialog_loading.dart';
import 'package:flutter_pat_shop/util/validation.dart';
import 'package:flutter_pat_shop/util/widgets/already_have_an_account.dart';
import 'package:flutter_pat_shop/util/widgets/rounded_button.dart';
import 'package:flutter_pat_shop/util/widgets/rounded_password_field.dart';
import 'package:flutter_pat_shop/util/widgets/rounded_phone_field.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
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
  bool incorrecet = true;

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
            errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
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
            },
            hintText: "Password",
          ),
          Container(
            child: incorrecet
                ? null
                : Text(
                    "The username or password is incorrect. Try again",
                    style: TextStyle(color: Colors.red),
                  ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          RoundedButton(
            press: (filledAll && Validation.isValidatedMobile(phoneNumber))
                ? () {
                    ShowDialogLoading.showDialogLoading(context);
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
        "user/read_single_login.php?userPhone=${phoneNumber.trim()}&userPass=${password.trim()}";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      if (json['message']
          .toString()
          .toUpperCase()
          .contains("Have data".toUpperCase())) {
        print(json['message']);
        User user = User.fromJson(json['data']);
        print(user.toString());
        setState(() {
          _saveInfoUser(user: user);
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => MainApplication(),
            ),
            (route) => false,
          );
          MySnackBar.snackBar("Login Successful!", context);
        });
      } else {
        print(json['message']);
        MySnackBar.snackBar(json['message'], context);
        setState(() {
          incorrecet = false;
        });
      }
      print("${json.toString()}");
    } else {
      Navigator.pop(context);
      MySnackBar.snackBar("Error!", context);
      print("Error");
    }
  }

  _saveInfoUser({required User user}) async {
    final saveData = await SharedPreferences.getInstance();
    saveData.setBool(IS_LOGIN, true);
    saveData.setString(USER_ID, user.userID);
    saveData.setString(USER_NAME, user.userName);
    saveData.setString(USER_AVATAR, user.userPhone);
    saveData.setString(USER_EMAIL, user.userEmail);
    saveData.setString(USER_AVATAR, user.userAvatar);
    print("Saved data");
  }
}
