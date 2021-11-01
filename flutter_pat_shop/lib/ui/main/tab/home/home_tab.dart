import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/ui/main/tab/home/components/body_home_tab.dart';
import 'package:flutter_pat_shop/util/constants.dart';
import 'package:flutter_pat_shop/util/my_snack_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({ Key? key }) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: TextField(
          cursorColor: Colors.black,
          //TODO search
        ),
        actions: [
          Icon(
            Icons.mail,
            color: Colors.white.withOpacity(0.8),
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.notifications,
            color: Colors.white.withOpacity(0.8),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
       floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final sharePref = await SharedPreferences.getInstance();
          sharePref.setBool(IS_LOGIN, false);
          MySnackBar.snackBar(
              IS_LOGIN + sharePref.getBool(IS_LOGIN).toString(), context);
          // TODO call for helpdex
          MySnackBar.snackBar("Call Me", context);
        },
        child: Icon(Icons.phone),
        backgroundColor: Colors.green,
      ),
      body: BodyHomeTab(),
    );
  }
}