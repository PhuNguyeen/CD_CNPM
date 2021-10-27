import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/model/product/product.dart';
import 'package:flutter_pat_shop/util/constants.dart';
import 'package:flutter_pat_shop/util/my_snack_bar.dart';
import 'package:http/http.dart' as http;

import 'components/list_category.dart';
import 'components/recomended_product.dart';
import 'components/slider_ads.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  bool loading = true;
  late ScrollController scrollController;
  List<Product> listProduct = [];
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        if (scrollController.position.extentAfter == 0) {
          loadListRecomenedProduct();
        }
      });
    loadListRecomenedProduct();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      clipBehavior: Clip.antiAlias,
      controller: scrollController,
      shrinkWrap: true,
      children: [
        SliderADS(),
        CategoryProduct(),
        buildLabelForList(),
        RecomendedProduct(
          listProduct: listProduct,
        ),
        Container(
          margin: EdgeInsets.all(12),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
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
      
  loadListRecomenedProduct() async {
    Uri apiLink =
        Uri.parse("$LINK_API/product/read_limit.php?start=0&limit=5");
    var response = await http.get(apiLink);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      if (json['message']
          .toString()
          .toUpperCase()
          .contains("Have data".toUpperCase())) {
        List<dynamic> jsonListProduct = json['data']['Product'];

        for (var i = 0; i < jsonListProduct.length; i++) {
          listProduct.add(Product.fromJson(jsonListProduct[i]));
        }
        setState(() {
          print(listProduct.length);
        });
      } else {
        print('No data');
      }
      print(json['message']);
    } else {
      print("Error load recomended product!");
      MySnackBar.snackBar("Error load recomended product!", context);
    }
  }
}
