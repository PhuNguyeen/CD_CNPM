import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/ui/main/tab/home/components/card_product.dart';
import 'package:flutter_pat_shop/ui/search_product/search_viewmodel.dart';
import 'package:flutter_pat_shop/ui/show_product/components/text_head_show_product.dart';
import 'package:flutter_pat_shop/ui/show_product/show_product_screen.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:scoped_model/scoped_model.dart';

class BodySearchScreen extends StatefulWidget {
  const BodySearchScreen({Key? key}) : super(key: key);

  @override
  _BodySearchScreenState createState() => _BodySearchScreenState();
}

class _BodySearchScreenState extends State<BodySearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: ScopedModelDescendant<SearchViewModel>(
        builder: (context, child, model) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: 
                model.contentSearched.isEmpty
                    ? SizedBox.shrink()
                    : Padding(
                        padding: const EdgeInsets.all(16),
                        child: TextHeadShowProduct(
                            text: 'Result for "${model.contentSearching.trim()}"'),
                      ),
            ),
            Expanded(
              flex: 12,
              child: model.productsList.isEmpty && model.contentSearched.isNotEmpty
                  ? Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: Center(
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/no-product-found.png",
                              width: 100,
                              errorBuilder: (context, error, stackTrace) =>
                                  Icon(Icons.error),
                            ),
                            Text("No products found!")
                          ],
                        ),
                      ),
                    )
                  : StaggeredGridView.countBuilder(
                      itemCount: model.productsList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      crossAxisCount: 2,
                      itemBuilder: (context, index) {
                        return CardProduct(
                          product: model.productsList[index],
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ShowProductScreen(
                                        product: model.productsList[index],
                                      )),
                            );
                          },
                        );
                      },
                      staggeredTileBuilder: (index) =>
                          StaggeredTile.count(1, 1.7),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
