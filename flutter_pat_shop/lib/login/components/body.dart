import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/constants.dart';
import 'package:flutter_pat_shop/home/home_screen.dart';
import 'package:flutter_pat_shop/model/user.dart';
import 'package:flutter_pat_shop/register/register_screen.dart';
import 'package:flutter_pat_shop/widgets/already_have_an_account.dart';
import 'package:flutter_pat_shop/widgets/rounded_button.dart';
import 'package:flutter_pat_shop/widgets/rounded_input_field.dart';
import 'package:flutter_pat_shop/widgets/rounded_password_field.dart';
import 'background.dart';
import 'package:http/http.dart' as http;

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var phoneNumber = "";

  var password = "";

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
              phoneNumber = value;
            },
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          RoundedPasswordField(
            onChange: (value) {
              password = value;
            },
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          RoundedButton(
            press: () {
              //TODO Check số điện thoại đúng định dạng hay chưa sau đó gửi số điện thoại và mật khẩu trả về User
              getDataUser();
              if (true) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              }
            },
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

  Future<bool> getDataUser() async {
    String url =
        api + "login.php?userPhone=${phoneNumber}&userPass=${password}";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    User user = User(
      jsonData['userID'],
      jsonData['userName'],
      jsonData['userPhone'],
      jsonData['userPass'],
      jsonData['userEmail'],
      jsonData['userAvatar'],
      jsonData['userRole'],
    );
    print(user.userName);
    return true;
  }
}
