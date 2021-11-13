import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/ui/main/tab/home/home_tab_viewmodel.dart';
import 'package:flutter_pat_shop/util/constants.dart';
import 'package:flutter_pat_shop/util/widgets/space_grey.dart';
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
      builder: (context, child, model) => CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 240,
            backgroundColor: Colors.orange,
            actions: [
              Icon(
                Icons.mail,
                color: Colors.white,
              ),
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.notifications,
                color: Colors.white,
              ),
              SizedBox(
                width: 20,
              ),
            ],
            title: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.search),
                  Text(
                    "Tìm kiếm trong cửa hàng...",
                    style: TextStyle(
                      color: Colors.orange.shade900,
                      fontWeight: FontWeight.normal,
                      fontSize: 16
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: Colors.white,
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  SliderADS(),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                CategoryProduct(),
                SpaceGrey(),
                RecomendedProduct(),
                Container(
                  margin: EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ScopedModelDescendant<HomeTabViewModel>(
                        builder: (context, child, model) => Container(
                          padding: EdgeInsets.all(12),
                          height: 100,
                          child: Center(
                            child: model.isLoading
                                ? CircularProgressIndicator()
                                : (model.noProductFound
                                    ? buildImageNoProductFound()
                                    : SizedBox.expand()),
                          ),
                        ),
                      ),
                      model.message == null
                          ? Container()
                          : buildBottomMessage(model.message!),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
        physics: ScrollPhysics(),
        controller: scrollController
          ..addListener(() async {
            if (scrollController.position.extentAfter ==
                    scrollController.position.minScrollExtent &&
                !model.isLoading) {
              await model.updateRecomendedProductsList();
              print("Load ${model.page}");
            }
          }),
        shrinkWrap: true,
      ),
    );
  }

  Widget buildBottomMessage(String message) => Container(
        margin: EdgeInsets.only(top: 20),
        child: Text(message),
      );

  Widget buildImageNoProductFound() => Container(
          child: Image.asset(
        "assets/images/no-product-found.png",
        fit: BoxFit.fill,
        errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
      ));
}
