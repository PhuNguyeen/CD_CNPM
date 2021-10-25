import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/main/tab/home/components/card_recomended_product.dart';
import 'package:flutter_pat_shop/model/product/product.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class RecomendedProduct extends StatefulWidget {
  const RecomendedProduct({Key? key}) : super(key: key);

  @override
  _RecomendedProductState createState() => _RecomendedProductState();
}

class _RecomendedProductState extends State<RecomendedProduct> {
  List<Product> listProduct = [
    Product(
      productID: 1,
      productName: "productName",
      productImage: "productImage",
      productPrice: "productPrice",
      categoryID: 1,
      manufacturerID: 1,
    ),
    Product(
      productID: 1,
      productName: "productName",
      productImage: "productImage",
      productPrice: "productPrice",
      categoryID: 1,
      manufacturerID: 1,
    ),
    Product(
      productID: 1,
      productName: "productName",
      productImage: "productImage",
      productPrice: "productPrice",
      categoryID: 1,
      manufacturerID: 1,
    ),
    Product(
      productID: 1,
      productName: "productName",
      productImage: "productImage",
      productPrice: "productPrice",
      categoryID: 1,
      manufacturerID: 1,
    ),
    Product(
      productID: 1,
      productName: "productName",
      productImage: "productImage",
      productPrice: "productPrice",
      categoryID: 1,
      manufacturerID: 1,
    ),
    Product(
      productID: 1,
      productName: "productName",
      productImage: "productImage",
      productPrice: "productPrice",
      categoryID: 1,
      manufacturerID: 1,
    ),
    Product(
      productID: 1,
      productName: "productName",
      productImage: "productImage",
      productPrice: "productPrice",
      categoryID: 1,
      manufacturerID: 1,
    ),
    Product(
      productID: 1,
      productName: "productName",
      productImage: "productImage",
      productPrice: "productPrice",
      categoryID: 1,
      manufacturerID: 1,
    ),
    Product(
      productID: 1,
      productName: "productName",
      productImage: "productImage",
      productPrice: "productPrice",
      categoryID: 1,
      manufacturerID: 1,
    ),
  ];

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
          itemBuilder: (context, index) => CardRecomendedProduct(
                product: listProduct[index],
                onTap: () {},
              ),
          staggeredTileBuilder: (index) => StaggeredTile.count(1, 1.7)));
}
