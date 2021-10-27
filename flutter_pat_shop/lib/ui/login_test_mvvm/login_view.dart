import 'package:flutter/material.dart';

import 'login_viewmodel.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // late ProgressDialog progressDialog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyWidget(),
    );
  }
}

class BodyWidget extends StatefulWidget {
  const BodyWidget({Key? key}) : super(key: key);

  @override
  _BodyWidgetState createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();

  final loginViewModel = LoginViewModel();

  @override
  // ignore: must_call_super
  void initState() {
    phoneNumberController.addListener(() {
      loginViewModel.phoneNumberSink.add(phoneNumberController.text);
    });
    passwordController.addListener(() {
      loginViewModel.passwordSink.add(passwordController.text);
    });
  }

  @override
  void dispose() {
    super.dispose();

    loginViewModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(50, 25, 50, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 50),
            child: Image(
              width: 100,
              image: AssetImage("assets/images/logo_app.png"),
              errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
            ),
          ),
          StreamBuilder<String>(
              stream: loginViewModel.phoneNumberStream,
              builder: (context, snapshot) {
                return TextFormField(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Phone number *",
                    icon: Icon(Icons.phone_android),
                    errorText: snapshot.data,
                  ),
                );
              }),
          StreamBuilder<String>(
              stream: loginViewModel.passwordStream,
              builder: (context, snapshot) {
                return TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password *",
                    icon: Icon(Icons.lock),
                    errorText: snapshot.data,
                  ),
                );
              }),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 200,
            child: StreamBuilder<bool>(
                stream: loginViewModel.buttonLoginStream,
                builder: (context, snapshot) {
                  // ignore: deprecated_member_use
                  return RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: snapshot.data == true
                        ? () => {print("Login " + snapshot.data.toString())}
                        : null,
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.blue,
                  );
                }),
          )
        ],
      ),
    );
  }
}
