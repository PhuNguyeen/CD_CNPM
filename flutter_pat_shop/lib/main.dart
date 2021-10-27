import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:flutter_pat_shop/ui/login/login_screen.dart';
import 'package:flutter_pat_shop/ui/login/login_viewmodel.dart';
import 'package:flutter_pat_shop/ui/main/main_application.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    LoginViewModel loginViewModel = LoginViewModel.getInstance();
    return ScopedModel<LoginViewModel>(
        model: loginViewModel,
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.orange,
            ),
            home: ScopedModelDescendant<LoginViewModel>(
              builder: (context, child, model) {
                return model.isLogin ? MainApplication() : LoginScreen();
              },
            )
            ));
  }
}
