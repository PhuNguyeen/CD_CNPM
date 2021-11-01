import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/ui/main/tab/cart/components/bottom_cart.dart';
import 'package:flutter_pat_shop/ui/main/tab/cart/components/product_list_cart.dart';
import 'package:flutter_pat_shop/util/widgets/space_grey.dart';

class BodyCart extends StatelessWidget {
  const BodyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Flexible(
          flex: 9,
          child: ProductListCart(),
        ),
        SpaceGrey(),
        Flexible(
          flex: 3,
          child: BottomCart(),
        ),
      ],
    ));
  }
}
