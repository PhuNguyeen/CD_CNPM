import 'package:flutter/material.dart';

import 'components/body_register.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyRegister(),
    );
  }
}

