import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/main/tab/home/components/list_category.dart';
import 'package:flutter_pat_shop/main/tab/home/components/recomended_product.dart';
import 'package:flutter_pat_shop/main/tab/home/components/slider_ads.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        SliderADS(),
        CategoryProduct(),
        buildLabelForList(),
        RecomendedProduct(),
      ],
    );
  }
  
  Widget buildLabelForList() => Container(
        padding: EdgeInsets.only(left: 16.0),
        child: Text(
          "Recomended Product",
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
        ),
      );
}
