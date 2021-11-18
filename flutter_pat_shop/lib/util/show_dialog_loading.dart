import 'package:flutter/material.dart';

class ShowDialogLoading{
  static void showDialogLoading(BuildContext context){
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(),
              Container(
                  margin: EdgeInsets.only(left: 7),
                  child: Text("Loading...")),
            ],
          ),
        ));
  }
}