import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/ui/main/tab/home/home_tab_viewmodel.dart';
import 'package:scoped_model/scoped_model.dart';

import 'list_category.dart';
import 'recomended_product.dart';
import 'slider_ads.dart';

class BodyHomeTab extends StatefulWidget {
  const BodyHomeTab({Key? key}) : super(key: key);

  @override
  _BodyHomeTabState createState() => _BodyHomeTabState();
}

class _BodyHomeTabState extends State<BodyHomeTab> {
  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    return ScopedModelDescendant<HomeTabViewModel>(
      builder: (context, child, model) => ListView(
        padding: EdgeInsets.only(bottom: 48),
        physics: BouncingScrollPhysics(),
        clipBehavior: Clip.antiAlias,
        controller: scrollController
          ..addListener(() async {
            if (scrollController.position.extentAfter ==
                        scrollController.position.minScrollExtent &&
                    !model.isLoading
                // &&scrollController.position.extentAfter.toString()
                ) {
              await model.updateRecomendedProductsList();
              print("Load ${model.page}");
            }
            // Future.delayed(Duration(), () {
            //   if (scrollController.position.extentAfter == 0 &&
            //       !model.isLoading) {
            //     model.updateRecomendedProductsList();
            //     print("Load ${model.page}");
            //   }
            // });
          }),
        shrinkWrap: true,
        children: [
          SliderADS(),
          CategoryProduct(),
          buildLabelForList(),
          RecomendedProduct(),
          Container(
            margin: EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ScopedModelDescendant<HomeTabViewModel>(
                  builder: (context, child, model) => Container(
                    padding: EdgeInsets.all(12),
                    child: Center(
                      child:
                          model.isLoading ? CircularProgressIndicator() : null,
                    ),
                  ),
                ),
                buildImageNoProductFound(),
                buildBottomMessage(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLabelForList() => Container(
        padding: EdgeInsets.only(left: 16.0),
        child: Text(
          "Recomended Product",
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
        ),
      );

  Widget buildBottomMessage() => ScopedModelDescendant<HomeTabViewModel>(
        builder: (context, child, model) => Container(
          margin: EdgeInsets.only(top: 20, bottom: 28),
          child: model.message == null ? null : Text(model.message!),
        ),
      );

  Widget buildImageNoProductFound() => ScopedModelDescendant<HomeTabViewModel>(
        builder: (context, child, model) => Container(
          child: model.noProductFound
              ? Image.asset(
                  "assets/images/no-product-found.png",
                  fit: BoxFit.fill,
                  height: 100,
                  errorBuilder: (context, error, stackTrace) =>
                      Icon(Icons.error),
                )
              : null,
        ),
      );
}
