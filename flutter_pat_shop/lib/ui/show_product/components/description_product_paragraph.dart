import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/ui/show_product/components/text_head_show_product.dart';
import 'package:flutter_pat_shop/ui/show_product/show_product_viewmodel.dart';
import 'package:scoped_model/scoped_model.dart';

class DescriptionProductParagraph extends StatelessWidget {
  const DescriptionProductParagraph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: ScopedModelDescendant<ShowProductViewModel>(
        builder: (context, child, model) => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextHeadShowProduct(
              text: "Description",
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              child: Text(model.specifications == null
                  ? ""
                  : "${model.specifications!.productDescription}"),
            ),
          ],
        ),
      ),
    );
  }
}
