import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/login/login_viewmodel.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // late ProgressDialog progressDialog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
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
  void initState() {
    // TODO: implement initState
    phoneNumberController.addListener(() {
      loginViewModel.phoneNumberSink.add(phoneNumberController.text);
    });
    passwordController.addListener(() {
      loginViewModel.passwordSink.add(passwordController.text);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    loginViewModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
          SizedBox(
            height: 20,
          ),
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
            height: 100,
          ),
          SizedBox(
            width: 200,
            child: StreamBuilder<bool>(
                stream: loginViewModel.buttonLoginStream,
                builder: (context, snapshot) {
                  return RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed:
                        snapshot.data == true ? () => {print("Login " + snapshot.data.toString())} :
                        null,
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
