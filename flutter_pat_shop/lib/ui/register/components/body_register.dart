import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pat_shop/ui/enter_otp/enter_opt_screen.dart';
import 'package:flutter_pat_shop/ui/login/login_screen.dart';
import 'package:flutter_pat_shop/ui/register/components/socal_icon.dart';
import 'package:flutter_pat_shop/util/constants.dart';
import 'package:flutter_pat_shop/util/my_snack_bar.dart';
import 'package:flutter_pat_shop/util/show_dialog_loading.dart';
import 'package:flutter_pat_shop/util/validation.dart';
import 'package:flutter_pat_shop/util/widgets/already_have_an_account.dart';
import 'package:flutter_pat_shop/util/widgets/rounded_button.dart';
import 'package:flutter_pat_shop/util/widgets/rounded_phone_field.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import 'package:http/http.dart' as http;

import 'background_register.dart';
import 'or_divider.dart';

class BodyRegister extends StatefulWidget {
  BodyRegister({
    Key? key,
  }) : super(key: key);

  @override
  _BodyRegisterState createState() => _BodyRegisterState();
}

class _BodyRegisterState extends State<BodyRegister> {
  var phoneNumber = "";
  final controllerPhoneNumber = TextEditingController();
  String _verificationId = "";
  FirebaseAuth? auth;
  bool incorrecet = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        height: size.height,
        width: double.infinity,
        child: BackgroundRegister(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/letgo.png",
                height: size.height * 0.35,
                errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
                child: RichText(
                  text: TextSpan(
                      text: "Enter your phone number to ",
                      children: [
                        TextSpan(
                            text: "register",
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
                errorText: Validation.validateMobile(phoneNumber),
              ),
              Container(
                child: incorrecet
                    ? null
                    : Text(
                        "This user already exists. Try again",
                        style: TextStyle(color: Colors.red),
                      ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              RoundedButton(
                text: "SIGNUP",
                press: Validation.isValidatedMobile(phoneNumber)
                    ? () {
                        ShowDialogLoading.showDialogLoading(context);
                        _checkExists();
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
        MySnackBar.snackBar(verificationFailed.message.toString(), context);
        print(verificationFailed.message.toString());
      },
      codeSent: (verificationId, resendingToken) async {
        _verificationId = verificationId;
        print(verificationId);
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
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
        MySnackBar.snackBar("Error timeout!", context);
      },
      timeout: const Duration(seconds: 60),
    );
  }

  _checkExists() async {
    Uri apiLink = Uri.parse(
        LINK_API + "user/read_single_signup.php?userPhone=$phoneNumber");
    final response = await http.get(apiLink);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      if (json["message"]
          .toString()
          .toUpperCase()
          .contains("User exists".toUpperCase())) {
        setState(() {
          incorrecet = false;
          Navigator.pop(context);
        });
      } else {
        _sentOTP();
      }
    } else {
      print("Error!");
      MySnackBar.snackBar("Error!", context);
    }
  }
}
