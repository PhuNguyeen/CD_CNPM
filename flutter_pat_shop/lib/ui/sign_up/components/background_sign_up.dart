import 'package:flutter/material.dart';

class BackgroundSignUp extends StatelessWidget {
  final Widget child;
  const BackgroundSignUp({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
      ],
    );
  }
}
