import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/until/constants.dart';
import 'package:flutter_pat_shop/screens/enter_info_user/components/body_enter_info_user.dart';

class EnterInfoUserScreen extends StatelessWidget {
  final String phoneNumber;
  EnterInfoUserScreen({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor.shade100,
        leading: CupertinoNavigationBarBackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BodyEnterInfoUser(phoneNumber: phoneNumber,),
    );
  }
}
