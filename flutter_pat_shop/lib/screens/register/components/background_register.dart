import 'package:flutter/material.dart';

class BackgroundRegister extends StatelessWidget {
  final Widget child;
  const BackgroundRegister({Key? key, required this.child}) : super(key: key);

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
