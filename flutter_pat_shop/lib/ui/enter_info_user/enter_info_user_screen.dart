import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/ui/enter_info_user/components/body_enter_info_user.dart';
import 'package:flutter_pat_shop/ui/enter_info_user/enter_info_user_view_model.dart';
import 'package:flutter_pat_shop/util/constants.dart';
import 'package:scoped_model/scoped_model.dart';

class EnterInfoUserScreen extends StatefulWidget {
  final String phoneNumber;
  EnterInfoUserScreen({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  _EnterInfoUserScreenState createState() => _EnterInfoUserScreenState();
}

class _EnterInfoUserScreenState extends State<EnterInfoUserScreen> {
  EnterInfoUserViewModel enterInfoUserViewModel =
      EnterInfoUserViewModel.getInstace();

  @override
  Widget build(BuildContext context) {
    return ScopedModel<EnterInfoUserViewModel>(
      model: enterInfoUserViewModel,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor.shade100,
          leading: CupertinoNavigationBarBackButton(
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: BodyEnterInfoUser(userPhone: widget.phoneNumber),
      ),
    );
  }
}
