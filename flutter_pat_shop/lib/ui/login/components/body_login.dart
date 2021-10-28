import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/ui/login/login_screen.dart';
import 'package:flutter_pat_shop/ui/login/login_viewmodel.dart';
import 'package:flutter_pat_shop/ui/main/main_application.dart';
import 'package:flutter_pat_shop/ui/sign_up/sign_up_screen.dart';
import 'package:flutter_pat_shop/util/my_snack_bar.dart';
import 'package:flutter_pat_shop/util/show_dialog_loading.dart';
import 'package:flutter_pat_shop/util/validation.dart';
import 'package:flutter_pat_shop/util/widgets/already_have_an_account.dart';
import 'package:flutter_pat_shop/util/widgets/rounded_button.dart';
import 'package:flutter_pat_shop/util/widgets/rounded_password_field.dart';
import 'package:flutter_pat_shop/util/widgets/rounded_phone_field.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:scoped_model/scoped_model.dart';
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
    LoginViewModel loginViewModel = LoginViewModel.getInstance();

    return ScopedModel<LoginViewModel>(
      model: loginViewModel,
      child: SingleChildScrollView(
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
            ScopedModelDescendant<LoginViewModel>(
              builder: (context, child, model) {
                return Container(
                  child: model.message == null
                      ? null
                      : Text(
                          "${model.message}",
                          style: TextStyle(color: Colors.red),
                        ),
                );
              },
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundedButton(
              press: (filledAll && Validation.isValidatedMobile(phoneNumber))
                  ? () {
                      bool _isSuccessful = false;
                      ShowDialogLoading.showDialogLoading(context);
                      Future.delayed(Duration(seconds: 3), () async {
                        _isSuccessful = await loginViewModel.updateMessage(
                            phoneNumber, password);
                        Navigator.pop(context);
                        if (!_isSuccessful) {
                          MySnackBar.snackBar("Login fail!", context);
                        } else {
                          MySnackBar.snackBar("Login successful!", context);
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainApplication()),
                              (route) => false);
                        }
                      });
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
                    return SignUpScreen();
                  },
                ));
              },
            )
          ],
        )),
      ),
    );
  }
}
