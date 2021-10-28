import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/util/constants.dart';

import 'package:flutter_pat_shop/ui/login/login_screen.dart';
import 'package:flutter_pat_shop/ui/main/main_application.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLogin = false;
  @override
  void initState() {
    super.initState();
    setLogin();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: isLogin ? MainApplication() : LoginScreen(),
    );
  }

  void setLogin() async {
    var sharedPref = await SharedPreferences.getInstance();
    isLogin = sharedPref.getBool(IS_LOGIN)!;
    setState(() {
      print("Login ${isLogin.toString()}");
    });
  }
}
