import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/model/product/product.dart';
import 'package:flutter_pat_shop/ui/show_product/components/choose_option_paragraph.dart';
import 'package:flutter_pat_shop/ui/show_product/components/general_information_paragraph.dart';
import 'package:flutter_pat_shop/ui/show_product/components/information_product_paragraph.dart';
import 'package:flutter_pat_shop/ui/show_product/components/related_product_paragraph.dart';
import 'package:flutter_pat_shop/ui/show_product/components/review_product_paragraph.dart';

class BodyShowProduct extends StatefulWidget {
  const BodyShowProduct({Key? key}) : super(key: key);

  @override
  _BodyShowProductState createState() => _BodyShowProductState();
}

class _BodyShowProductState extends State<BodyShowProduct> {
  Product product = Product(
      productID: "1",
      productName: "iPhone 12 Pro Max",
      productImage: "11.png",
      productPrice: null,
      manufacturerName: "Apple",
      countUser: "0",
      sumRate: "0",
      countProductBill: "0");
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Column(
        children: [
          GeneralInformationParagraph(),
          buildSpace(),
          ChooseOptionParagraph(),
          buildSpace(),
          InformationProductParagraph(),
          buildSpace(),
          RelatedProductParagraph(product: product,),
          buildSpace(),
          ReviewProductParagraph(product: product,),
          buildSpace(),
        ],
      ),
    );
  }

  Widget buildSpace() => SizedBox(
        height: 12,
        child: Container(
          color: Colors.grey.shade100,
        ),
      );
}
