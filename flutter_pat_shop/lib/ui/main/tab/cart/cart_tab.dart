import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/ui/main/tab/cart/components/body_cart.dart';

class CartTab extends StatefulWidget {
  const CartTab({Key? key}) : super(key: key);

  @override
  _CartTabState createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Shopping Cart",
          style: TextStyle(
            color: Colors.grey.shade100,
          ),
        ),
      ),
      body: BodyCart(),
    );
  }
}
