import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/model/product/product.dart';
import 'package:flutter_pat_shop/ui/show_product/components/choose_option_paragraph.dart';
import 'package:flutter_pat_shop/ui/show_product/components/description_product_paragraph.dart';
import 'package:flutter_pat_shop/ui/show_product/components/general_information_paragraph.dart';
import 'package:flutter_pat_shop/ui/show_product/components/information_product_paragraph.dart';
import 'package:flutter_pat_shop/ui/show_product/components/related_product_paragraph.dart';
import 'package:flutter_pat_shop/ui/show_product/components/review_product_paragraph.dart';
import 'package:flutter_pat_shop/ui/show_product/show_product_viewmodel.dart';
import 'package:flutter_pat_shop/util/widgets/space_grey.dart';
import 'package:scoped_model/scoped_model.dart';

class BodyShowProduct extends StatefulWidget {
  final Product product;

  BodyShowProduct({Key? key, required this.product}) : super(key: key);

  @override
  _BodyShowProductState createState() => _BodyShowProductState();
}

class _BodyShowProductState extends State<BodyShowProduct> {
  ShowProductViewModel? showProductViewModel;
  @override
  Widget build(BuildContext context) {
    if (showProductViewModel == null) {
      showProductViewModel =
          ShowProductViewModel.getInstance(widget.product.productID);
    }

    return ScopedModel<ShowProductViewModel>(
      model: showProductViewModel!,
      child: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            GeneralInformationParagraph(
              product: widget.product,
            ),
            SpaceGrey(),
            ChooseOptionParagraph(),
            SpaceGrey(),
            InformationProductParagraph(),
            SpaceGrey(),
            SpaceGrey(),
            DescriptionProductParagraph(),
            SpaceGrey(),
            RelatedProductParagraph(
              product: widget.product,
            ),
            SpaceGrey(),
            ReviewProductParagraph(
              product: widget.product,
            ),
            SpaceGrey(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    showProductViewModel!.dispose();
    super.dispose();
  }
}
