import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/login/login_screen.dart';
import 'package:flutter_pat_shop/register/components/background.dart';
import 'package:flutter_pat_shop/register/components/or_divider.dart';
import 'package:flutter_pat_shop/register/components/socal_icon.dart';
import 'package:flutter_pat_shop/widgets/already_have_an_account.dart';
import 'package:flutter_pat_shop/widgets/rounded_button.dart';
import 'package:flutter_pat_shop/widgets/rounded_input_field.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        height: size.height,
        width: double.infinity,
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
                hintText: "0123XXXX89",
                textInputType: TextInputType.phone,
                onChanged: (value) {},
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              RoundedButton(
                text: "SIGNUP",
                press: () {},
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ));
                },
              ),
              OrDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocalIcon(
                    iconSrc: "assets/images/ic_facebook.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/images/ic_google.svg",
                    press: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

