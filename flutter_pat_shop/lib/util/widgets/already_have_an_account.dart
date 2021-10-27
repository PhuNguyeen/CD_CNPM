import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/util/constants.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function() press;

  const AlreadyHaveAnAccountCheck({Key? key, this.login = true, required this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? "Don't have an Account ? " :"Already have an Account ? ",
          style: TextStyle(color: kPrimaryColor.shade700),
        ),
        GestureDetector(
            onTap: press,
            child: Text(
              login ? "Sign Up" :"Sign In",
              style: TextStyle(
                  color: kPrimaryColor.shade700, fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
