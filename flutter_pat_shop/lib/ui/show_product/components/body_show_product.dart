import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/model/product/product.dart';
import 'package:flutter_pat_shop/ui/show_product/components/choose_option_paragraph.dart';
import 'package:flutter_pat_shop/ui/show_product/components/description_product_paragraph.dart';
import 'package:flutter_pat_shop/ui/show_product/components/general_information_paragraph.dart';
import 'package:flutter_pat_shop/ui/show_product/components/information_product_paragraph.dart';
import 'package:flutter_pat_shop/ui/show_product/components/related_product_paragraph.dart';
import 'package:flutter_pat_shop/ui/show_product/components/review_product_paragraph.dart';
import 'package:flutter_pat_shop/ui/show_product/show_product_viewmodel.dart';
import 'package:flutter_pat_shop/util/constants.dart';
import 'package:flutter_pat_shop/util/widgets/space_grey.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BodyShowProduct extends StatefulWidget {
  final Product product;

  BodyShowProduct({Key? key, required this.product}) : super(key: key);

  @override
  _BodyShowProductState createState() => _BodyShowProductState();
}

class _BodyShowProductState extends State<BodyShowProduct> {
  int activeIndex = 0;
  ShowProductViewModel? showProductViewModel;
  @override
  Widget build(BuildContext context) {
    if (showProductViewModel == null) {
      showProductViewModel = ShowProductViewModel.getInstance(widget.product);
    }
    double maxHeight = MediaQuery.of(context).size.height * 0.45;
    Size size = MediaQuery.of(context).size;
    return ScopedModel<ShowProductViewModel>(
      model: showProductViewModel!,
      child: CustomScrollView(
        physics: ScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: maxHeight,
            floating: false,
            pinned: true,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  buildSlideImageProduct(size),
                  buildIndicator(size),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
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
                RelatedProductParagraph(),
                SpaceGrey(),
                ReviewProductParagraph(
                  product: widget.product,
                ),
                SpaceGrey(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    showProductViewModel!.dispose();
    super.dispose();
  }

  Widget buildSlideImageProduct(Size size) =>
      ScopedModelDescendant<ShowProductViewModel>(
        builder: (context, child, model) => CarouselSlider.builder(
          itemCount: widget.product.productImage,
          itemBuilder: (context, index, realIndex) {
            return Image.network(
              "$LINK_IMAGE_PRODUCT/${widget.product.productID}${index + 1}.png",
              fit: BoxFit.fitHeight,
            );
          },
          options: CarouselOptions(
            height: size.height,
            autoPlay: true,
            scrollPhysics: BouncingScrollPhysics(),
            initialPage: 1,
            autoPlayInterval: Duration(seconds: 10),
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                activeIndex = index;
              });
            },
          ),
        ),
      );

  Widget buildIndicator(Size size) =>
      ScopedModelDescendant<ShowProductViewModel>(
        builder: (context, child, model) => Positioned(
          width: size.width,
          bottom: 10,
          child: Center(
            child: AnimatedSmoothIndicator(
              activeIndex: activeIndex,
              count: widget.product.productImage,
              effect: WormEffect(
                  activeDotColor: Colors.orange,
                  dotColor: Colors.white,
                  type: WormType.thin,
                  dotWidth: 10,
                  dotHeight: 10,
                  paintStyle: PaintingStyle.fill,
                  spacing: 4),
            ),
          ),
        ),
      );
}
