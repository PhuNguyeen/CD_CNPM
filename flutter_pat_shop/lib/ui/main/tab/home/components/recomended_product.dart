import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/ui/main/tab/home/home_tab_viewmodel.dart';
import 'package:flutter_pat_shop/ui/show_product/show_product_screen.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:scoped_model/scoped_model.dart';

import 'card_product.dart';

class RecomendedProduct extends StatefulWidget {
  RecomendedProduct({Key? key}) : super(key: key);

  @override
  _RecomendedProductState createState() => _RecomendedProductState();
}

class _RecomendedProductState extends State<RecomendedProduct> {
  @override
  Widget build(BuildContext context) {
    return buildListRecomendedProduct();
  }

  Widget buildListRecomendedProduct() => Container(
        padding: EdgeInsets.all(8.0),
        child: ScopedModelDescendant<HomeTabViewModel>(
          builder: (context, child, model) => StaggeredGridView.countBuilder(
            itemCount: model.recomendedProductsList.length,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            itemBuilder: (context, index) {
              return CardProduct(
                product: model.recomendedProductsList[index],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShowProductScreen(product: model.recomendedProductsList[index],)),
                  );
                  print("Tap product");
                },
              );
            },
            staggeredTileBuilder: (index) => StaggeredTile.count(1, 1.7),
          ),
        ),
      );
}
