import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/until/constants.dart';
import 'package:flutter_pat_shop/until/my_snack_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          final sharePref = await SharedPreferences.getInstance();
          sharePref.setBool(IS_LOGIN, false);
          MySnackBar.snackBar(IS_LOGIN + sharePref.getBool(IS_LOGIN).toString(), context);
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        color: Colors.yellow,
      ),
    );
  }
}
