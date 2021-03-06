import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/ui/enter_info_user/enter_info_user_screen.dart';
import 'package:flutter_pat_shop/util/my_snack_bar.dart';
import 'package:flutter_pat_shop/util/show_dialog_loading.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class EnterOtpScreen extends StatefulWidget {
  final String phoneNumber;
  final String verificationId;
  final FirebaseAuth auth;

  const EnterOtpScreen(
      {Key? key,
      required this.phoneNumber,
      required this.verificationId,
      required this.auth})
      : super(key: key);

  @override
  _EnterOtpScreenState createState() => _EnterOtpScreenState();
}

class _EnterOtpScreenState extends State<EnterOtpScreen> {
  TextEditingController textEditingController = TextEditingController();

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();
  String _verificationId = "";

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    _verificationId = widget.verificationId;
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {},
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: <Widget>[
              SizedBox(height: 30),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset("assets/images/send.png"),
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Phone Number Verification',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
                child: RichText(
                  text: TextSpan(
                      text: "Enter the code sent to ",
                      children: [
                        TextSpan(
                            text: "${widget.phoneNumber}",
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
                height: 20,
              ),
              Form(
                key: formKey,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 30),
                    child: PinCodeTextField(
                      appContext: context,
                      pastedTextStyle: TextStyle(
                        color: Colors.green.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                      length: 6,
                      // !icon obscuring (???n m?? otp)
                      // obscuringWidget: Icon(
                      //   Icons.whatshot,
                      //   color: kPrimaryColor,
                      // ),
                      blinkWhenObscuring: false,
                      animationType: AnimationType.fade,
                      validator: (v) {
                        if (v!.length < 3) {
                          return "I'm from validator";
                        } else {
                          return null;
                        }
                      },
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 40,
                        activeFillColor: Colors.white,
                      ),
                      cursorColor: Colors.black,
                      animationDuration: Duration(milliseconds: 300),
                      enableActiveFill: true,
                      errorAnimationController: errorController,
                      controller: textEditingController,
                      keyboardType: TextInputType.number,
                      boxShadows: [
                        BoxShadow(
                          offset: Offset(0, 1),
                          color: Colors.black12,
                          blurRadius: 10,
                        )
                      ],
                      onCompleted: (v) {
                        print("Completed");
                      },
                      // onTap: () {
                      //   print("Pressed");
                      // },
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          currentText = value;
                        });
                      },
                      beforeTextPaste: (text) {
                        print("Allowing to paste $text");
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  hasError ? "*Please fill up all the cells properly" : "",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't receive the code? ",
                    style: TextStyle(color: Colors.black54, fontSize: 15),
                  ),
                  TextButton(
                      onPressed: () {
                        ShowDialogLoading.showDialogLoading(context);
                        resendOTP();
                      },
                      child: Text(
                        "RESEND",
                        style: TextStyle(
                            color: Color(0xFF91D3B3),
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ))
                ],
              ),
              SizedBox(
                height: 14,
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
                child: ButtonTheme(
                  height: 50,
                  child: TextButton(
                    onPressed: () {
                      formKey.currentState!.validate();
                      // conditions for validating
                      // if (currentText.length != 6 || currentText != "123456") {
                      //   errorController!.add(ErrorAnimationType
                      //       .shake); // Triggering error shake animation
                      //   setState(() => hasError = true);
                      // } else {
                      setState(
                        () {
                          check(currentText, _verificationId);
                        },
                      );
                      // }
                    },
                    child: Center(
                        child: Text(
                      "VERIFY".toUpperCase(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.green.shade300,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.green.shade200,
                          offset: Offset(1, -2),
                          blurRadius: 5),
                      BoxShadow(
                          color: Colors.green.shade200,
                          offset: Offset(-1, 2),
                          blurRadius: 5)
                    ]),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                      child: TextButton(
                    child: Text("Clear"),
                    onPressed: () {
                      textEditingController.clear();
                    },
                  )),
                  // Flexible(
                  //     child: TextButton(
                  //       child: Text("Set Text"),
                  //       onPressed: () {
                  //         setState(() {
                  //           textEditingController.text = "123456";
                  //         });
                  //       },
                  //     )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  check(String currentText, String verificationId) async {
    // Create a PhoneAuthCredential with the code
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: currentText);

    // Sign the user in (or link) with the credential
    try {
      final authCredential = await widget.auth.signInWithCredential(credential);
      if (authCredential.user != null) {
        MySnackBar.snackBar("OTP Verified!!", context);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EnterInfoUserScreen(
                phoneNumber: widget.phoneNumber,
              ),
            ));
      }
    } on FirebaseAuthException catch (e) {
      MySnackBar.snackBar(e.message, context);
      print(e.message);
      setState(() {
        errorController!.add(ErrorAnimationType.shake);
        hasError = true;
      });
    }
  }

  resendOTP() async {
    await widget.auth.verifyPhoneNumber(
      phoneNumber: "+" + widget.phoneNumber,
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
        MySnackBar.snackBar("Resend OTP!", context);
      },
      codeAutoRetrievalTimeout: (verificationId) async {
        Navigator.pop(context);
        MySnackBar.snackBar("Error timeout!", context);
      },
      timeout: const Duration(seconds: 60),
    );
  }
}
