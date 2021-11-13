import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pat_shop/ui/enter_otp/enter_opt_screen.dart';
import 'package:flutter_pat_shop/ui/login/login_screen.dart';
import 'package:flutter_pat_shop/ui/sign_up/components/socal_icon.dart';
import 'package:flutter_pat_shop/ui/sign_up/sign_up_viewmodel.dart';
import 'package:flutter_pat_shop/util/my_snack_bar.dart';
import 'package:flutter_pat_shop/util/show_dialog_loading.dart';
import 'package:flutter_pat_shop/util/validation.dart';
import 'package:flutter_pat_shop/util/widgets/already_have_an_account.dart';
import 'package:flutter_pat_shop/util/widgets/rounded_button.dart';
import 'package:flutter_pat_shop/util/widgets/rounded_phone_field.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import 'package:scoped_model/scoped_model.dart';

import 'background_sign_up.dart';
import 'or_divider.dart';

class BodySignUp extends StatefulWidget {
  BodySignUp({
    Key? key,
  }) : super(key: key);

  @override
  _BodySignUpState createState() => _BodySignUpState();
}

class _BodySignUpState extends State<BodySignUp> {
  final controllerPhoneNumber = TextEditingController();
  String _verificationId = "";
  FirebaseAuth? auth;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SignUpViewModel signUpViewModel = SignUpViewModel.getInstace();

    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Container(
        height: size.height,
        width: double.infinity,
        child: BackgroundSignUp(
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
                            text: "sign_up",
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
              ScopedModelDescendant<SignUpViewModel>(
                builder: (context, child, model) => RoundedPhoneField(
                  textInputType: TextInputType.phone,
                  hintText: "123XXXX89",
                  onChanged: (value) {
                    PhoneNumber pn = value;
                    model.updateUserPhone(pn.international.substring(1));
                  },
                  errorText: Validation.validateMobile(model.userPhone),
                ),
              ),
              ScopedModelDescendant<SignUpViewModel>(
                builder: (context, child, model) => Container(
                  child: signUpViewModel.message == null
                      ? null
                      : Text(
                          model.message!,
                          style: TextStyle(color: Colors.red),
                        ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              ScopedModelDescendant<SignUpViewModel>(
                builder: (context, child, model) => RoundedButton(
                  text: "SIGNUP",
                  press: model.isValidateUserPhone
                      ? () {
                          ShowDialogLoading.showDialogLoading(context);
                          Future.delayed(Duration(seconds: 3), () async {
                            final result = await signUpViewModel
                                .checkUserIsExist(model.userPhone);
                            // ! tạm cho đoạn này nhảy sang otp
                            // _sentOTP(model.userPhone);

                            if (result) {
                              _sentOTP(model.userPhone);
                            } else {
                              Navigator.pop(context);
                            }
                          });
                        }
                      : null,
                ),
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
                      MySnackBar.snackBar("Chưa xong chờ update", context);
                    },
                  ),
                  SocalIcon(
                    iconSrc: "assets/images/ic_google.svg",
                    press: () {
                      MySnackBar.snackBar("Chưa xong chờ update", context);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _sentOTP(String userPhone) async {
    await Firebase.initializeApp();
    auth = FirebaseAuth.instance;
    await auth!.verifyPhoneNumber(
      phoneNumber: "+" + userPhone,
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
              phoneNumber: userPhone,
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
}
