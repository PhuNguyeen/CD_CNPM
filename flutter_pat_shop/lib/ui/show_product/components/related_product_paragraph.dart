import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/ui/main/tab/home/components/card_product.dart';
import 'package:flutter_pat_shop/ui/show_product/components/text_head_show_product.dart';
import 'package:flutter_pat_shop/ui/show_product/show_product_screen.dart';
import 'package:flutter_pat_shop/ui/show_product/show_product_viewmodel.dart';
import 'package:scoped_model/scoped_model.dart';

class RelatedProductParagraph extends StatefulWidget {
  RelatedProductParagraph({Key? key}) : super(key: key);

  @override
  _RelatedProductParagraphState createState() =>
      _RelatedProductParagraphState();
}

class _RelatedProductParagraphState extends State<RelatedProductParagraph> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextHeadShowProduct(
              text: "Related Product",
            ),
          ),
          SizedBox(
            height: 16,
          ),
          buildListRelatedProduct(),
        ],
      ),
    );
  }

  Widget buildListRelatedProduct() => SizedBox(
        height: 320,
        child: ScopedModelDescendant<ShowProductViewModel>(
          builder: (context, child, model) => ListView.builder(
            itemCount: model.relatedProducts.length,
            padding: EdgeInsets.symmetric(vertical: 8),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => CardProduct(
              product: model.relatedProducts[index],
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      ShowProductScreen(product: model.relatedProducts[index]),
                ));
              },
            ),
          ),
        ),
      );
}
