import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/ui/main/main_application.dart';
import 'package:flutter_pat_shop/util/constants.dart';
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
    setState(() {
      _setData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MainApplication()
      //isLogin ? MainApplication() : LoginScreen(),
    );
  }

  _setData() async {
    final saveData = await SharedPreferences.getInstance();
    isLogin = saveData.getBool(IS_LOGIN) ?? false;
    print(isLogin.toString());
  }
}
