import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pat_shop/screens/enter_otp/enter_opt_screen.dart';
import 'package:flutter_pat_shop/screens/login/login_screen.dart';
import 'package:flutter_pat_shop/screens/register/components/socal_icon.dart';
import 'package:flutter_pat_shop/until/show_dialog_loading.dart';
import 'package:flutter_pat_shop/until/validation_login.dart';
import 'package:flutter_pat_shop/widgets/already_have_an_account.dart';
import 'package:flutter_pat_shop/widgets/rounded_button.dart';
import 'package:flutter_pat_shop/widgets/rounded_phone_field.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';

import 'background.dart';
import 'or_divider.dart';

class Body extends StatefulWidget {
  Body({
    Key? key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var phoneNumber = "";
  final controllerPhoneNumber = TextEditingController();
  String _verificationId = "";
  FirebaseAuth? auth;

  @override
  void initState() {
    super.initState();
  }

  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: Duration(seconds: 2),
      ),
    );
  }

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
                "assets/images/letgo.png",
                height: size.height * 0.35,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
                child: RichText(
                  text: TextSpan(
                      text: "Enter your phone number to ",
                      children: [
                        TextSpan(
                            text: "regiter",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15)),
                      ],
                      style: TextStyle(color: Colors.black54, fontSize: 15)),
                  textAlign: TextAlign.center,
                ),
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
                errorText: ValidationLogin.validateMobile(phoneNumber),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              RoundedButton(
                text: "SIGNUP",
                press: ValidationLogin.isValidatedMobile(phoneNumber)
                    ? () {
                        // showDialog(
                        //     context: context,
                        //     barrierDismissible: false,
                        //     builder: (context) => AlertDialog(
                        //           content: Row(
                        //             children: [
                        //               CircularProgressIndicator(),
                        //               Container(
                        //                   margin: EdgeInsets.only(left: 7),
                        //                   child: Text("Loading...")),
                        //             ],
                        //           ),
                        //         ));
                        ShowDialogLoading.showDialogLoading(context);
                        _sentOTP();
                        print(phoneNumber);
                      }
                    : null,
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Navigator.pop(context, MaterialPageRoute(
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
                    press: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          //TODO
                          return EnterOtpScreen(
                            phoneNumber: phoneNumber,
                            verificationId: _verificationId,
                            auth: auth!,
                          );
                        },
                      ));
                    },
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

  _sentOTP() async {
    await Firebase.initializeApp();
    auth = FirebaseAuth.instance;
    await auth!.verifyPhoneNumber(
      phoneNumber: "+" + phoneNumber,
      verificationCompleted: (credential) async {
        // if (Platform.isAndroid) {
        //   // ANDROID ONLY!
        //   // Sign the user in (or link) with the auto-generated credential
        //   await _auth!.signInWithCredential(credential);
        // }
        Navigator.pop(context);
      },
      verificationFailed: (verificationFailed) async {
        Navigator.pop(context);
        snackBar(verificationFailed.message.toString());
        print(verificationFailed.message.toString());
      },
      codeSent: (verificationId, resendingToken) async {
        _verificationId = verificationId;
        print(verificationId);
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            //TODO
            return EnterOtpScreen(
              phoneNumber: phoneNumber,
              verificationId: _verificationId,
              auth: auth!,
            );
          },
        ));
      },
      codeAutoRetrievalTimeout: (verificationId) async {
        Navigator.pop(context);
        snackBar("Error timeout!");
      },
      timeout: const Duration(seconds: 60),
    );
  }
}
