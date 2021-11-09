import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/ui/main/tab/account/account_tab.dart';
import 'package:flutter_pat_shop/ui/main/tab/cart/cart_tab.dart';
import 'package:flutter_pat_shop/ui/main/tab/home/home_tab.dart';
import 'package:flutter_pat_shop/ui/main/tab/wish_list/wish_list_tab.dart';

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
      body: IndexedStack(
        index: _currentIndex,
        children: tab,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        iconSize: 28,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.black87,
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
