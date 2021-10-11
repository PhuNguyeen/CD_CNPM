import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/register/register_screen.dart';
import 'package:flutter_pat_shop/widgets/already_have_an_account.dart';
import 'package:flutter_pat_shop/widgets/rounded_button.dart';
import 'package:flutter_pat_shop/widgets/rounded_input_field.dart';
import 'package:flutter_pat_shop/widgets/rounded_password_field.dart';

import 'background.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

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
            onChanged: (value) {},
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          RoundedPasswordField(
            onChange: (value) {},
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          RoundedButton(
            press: () {},
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
}
