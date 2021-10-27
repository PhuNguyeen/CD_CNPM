import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/model/product/product.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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

}
