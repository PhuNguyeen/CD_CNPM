import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/ui/sign_up/sign_up_viewmodel.dart';
import 'package:scoped_model/scoped_model.dart';

import 'components/body_sign_up.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpViewModel signUpViewModel = SignUpViewModel.getInstace();
    return ScopedModel(
        model: signUpViewModel,
        child: Scaffold(
          body: BodySignUp(),
        ));
  }
}
