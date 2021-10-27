import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/ui/main/tab/account/account_tab.dart';
import 'package:flutter_pat_shop/ui/main/tab/cart/cart_tab.dart';
import 'package:flutter_pat_shop/ui/main/tab/home/home_tab.dart';
import 'package:flutter_pat_shop/ui/main/tab/wish_list/wish_list_tab.dart';
import 'package:flutter_pat_shop/util/constants.dart';
import 'package:flutter_pat_shop/util/my_snack_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainApplication extends StatefulWidget {
  const MainApplication({Key? key}) : super(key: key);

  @override
  _MainApplicationState createState() => _MainApplicationState();
}

class _MainApplicationState extends State<MainApplication> {
  int _currentIndex = 0;
  late List<StatefulWidget> tab;

  @override
  void initState() {
    tab = [HomeTab(), WishListTab(), CartTab(), AccountTab()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: IndexedStack(
        index: _currentIndex,
        children: tab,
        // child: SafeArea(
        //   child: tab[],
        // ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        iconSize: 28,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        selectedLabelStyle:
            TextStyle(fontSize: 12, fontWeight: FontWeight.w900),
        unselectedLabelStyle:
            TextStyle(fontSize: 12, fontWeight: FontWeight.w900),
        enableFeedback: true,
        items: [
          buildBottomNavigationBar(icon: Icons.home, label: "Home"),
          buildBottomNavigationBar(icon: Icons.favorite, label: "Wishlist"),
          buildBottomNavigationBar(
              icon: Icons.shopping_cart_rounded, label: "Cart"),
          buildBottomNavigationBar(
              icon: Icons.person_rounded, label: "Account"),
        ],
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBar(
      {required IconData icon, required String label}) {
    return BottomNavigationBarItem(
      activeIcon: Container(
        margin: EdgeInsets.only(bottom: 8),
        width: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.blue.shade100),
        child: Icon(
          icon,
        ),
      ),
      icon: Icon(
        icon,
      ),
      label: label,
    );
  }
}