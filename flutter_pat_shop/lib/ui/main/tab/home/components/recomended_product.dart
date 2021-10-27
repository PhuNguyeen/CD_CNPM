import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/model/product/product.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart' as http;

import 'card_recomended_product.dart';

class RecomendedProduct extends StatefulWidget {
List<Product> listProduct;

  RecomendedProduct({Key? key, required this.listProduct}) : super(key: key);

  @override
  _RecomendedProductState createState() => _RecomendedProductState();
}

class _RecomendedProductState extends State<RecomendedProduct> {
  List<Product> listProduct = [];
  int start = 0;
  int limit = 5;
  bool isLoaded = false;

  @override
  void initState() {
    listProduct = widget.listProduct;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return buildListRecomendedProduct();
  }

  Widget buildListRecomendedProduct() => Container(
      padding: EdgeInsets.all(8.0),
      child: StaggeredGridView.countBuilder(
          itemCount: listProduct.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          itemBuilder: (context, index) {
            return CardRecomendedProduct(
                product: listProduct[index],
                onTap: () {
                  //TODO đến sản phẩm được chọn
                  print("Tap product");
                },
              );
          },
          staggeredTileBuilder: (index) => StaggeredTile.count(1, 1.7)));

  // loadListRecomenedProduct() async {
  //   Uri apiLink = Uri.parse(
  //       LINK_API + "product/read_limit.php?start=$start&limit=$limit");
  //   var response = await http.get(apiLink);

  //   if (response.statusCode == 200) {
  //     var json = jsonDecode(response.body);
  //     if (json['message']
  //         .toString()
  //         .toUpperCase()
  //         .contains("Have data".toUpperCase())) {
  //       List<dynamic> jsonListProduct = json['data']['Product'];

  //       for (var i = 0; i < jsonListProduct.length; i++) {
  //         listProduct.add(Product.fromJson(jsonListProduct[i]));
  //       }
  //       if (mounted) {
  //         setState(() {
  //           isLoaded = true;
  //           print(listProduct.length);
  //         });
  //       }
  //     }else{
  //       print('No data');
  //     }
  //     print(json['message']);
  //   } else {
  //     print("Error load recomended product!");
  //     MySnackBar.snackBar("Error load recomended product!", context);
  //   }
  // }
}
