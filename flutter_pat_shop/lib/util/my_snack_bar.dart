import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySnackBar {

  // snackBar Widget
  static snackBar(String? message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: Duration(seconds: 2),
      ),
    );
  }
}