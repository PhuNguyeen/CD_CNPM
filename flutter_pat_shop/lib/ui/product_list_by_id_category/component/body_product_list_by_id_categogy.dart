import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/ui/main/tab/home/components/card_product.dart';
import 'package:flutter_pat_shop/ui/product_list_by_id_category/product_list_by_id_categogy_viewmodel.dart';
import 'package:flutter_pat_shop/ui/show_product/show_product_screen.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:scoped_model/scoped_model.dart';

class BodyProductListByIdCategory extends StatefulWidget {
  const BodyProductListByIdCategory({Key? key}) : super(key: key);

  @override
  _BodyProductListByIdCategoryState createState() =>
      _BodyProductListByIdCategoryState();
}

class _BodyProductListByIdCategoryState
    extends State<BodyProductListByIdCategory> {
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: ScopedModelDescendant<ProductListByIdCategoryViewModel>(
        builder: (context, child, model) => StaggeredGridView.countBuilder(
          itemCount: model.products.length + 1,
          shrinkWrap: true,
          controller: scrollController
            ..addListener(() async {
              if (scrollController.position.extentAfter ==
                          scrollController.position.minScrollExtent &&
                      !model.isLoading
                  // &&scrollController.position.extentAfter.toString()
                  ) {
                await model.updateProducts();
                print("Load ${model.page}");
              }
            }),
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          crossAxisCount: 2,
          itemBuilder: (context, index) {
            if (index == model.products.length) {
              return ScopedModelDescendant<ProductListByIdCategoryViewModel>(
                  builder: (context, child, model) => Container(
                        padding: EdgeInsets.all(12),
                        child: Center(
                          child: model.isLoading
                              ? CircularProgressIndicator()
                              : Container(),
                        ),
                      ));
            }
            return CardProduct(
              product: model.products[index],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ShowProductScreen(
                            product: model.products[index],
                          )),
                );
              },
            );
          },
          staggeredTileBuilder: (index) => StaggeredTile.count(1, 1.7),
        ),
      ),
    );
  }
}
