import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/ui/show_product/components/body_show_product.dart';
import 'package:flutter_pat_shop/util/constants.dart';
import 'package:flutter_pat_shop/util/widgets/my_elevated_button.dart';

class ShowProductScreen extends StatelessWidget {
  const ShowProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          cursorColor: Colors.black,
          //TODO search
        ),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Icon(
            Icons.shopping_cart,
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
      body: BodyShowProduct(),
      bottomNavigationBar: bottomNavBarShowProduct(size),
    );
  }

  Widget bottomNavBarShowProduct(Size size) => Container(
        height: 60,
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 1,
              offset: Offset(-1, 0),
            ),
            BoxShadow(
              color: Colors.white,
              blurRadius: 1,
              offset: Offset(-1, 0),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyElevatedButton(
                magin: const EdgeInsets.symmetric(vertical: 8.0),
                color: Colors.blue.shade500,
                onPressed: () {},
                height: 50,
                width: 50,
                child: Icon(Icons.message_outlined, color: Colors.white,),
                borderRadius: BorderRadius.circular(50),
              ),
              MyElevatedButton(
                magin: const EdgeInsets.symmetric(vertical: 8.0),
                color: Colors.green.shade500,
                onPressed: () {},
                height: 50,
                width: size.width * 0.7,
                child: Text(
                  "Add to Shopping Cart",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                borderRadius: BorderRadius.circular(50),
              ),
            ],
          ),
        ),
      );
}
