import 'package:flutter/material.dart';

class TextHeadShowProduct extends StatelessWidget {
  String? text;
  TextHeadShowProduct({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text!,
        style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 18,
        ),
      ),
    );
  }
}
