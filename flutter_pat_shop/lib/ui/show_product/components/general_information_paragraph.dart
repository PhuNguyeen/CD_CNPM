import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/model/product/product.dart';
import 'package:flutter_pat_shop/ui/show_product/show_product_viewmodel.dart';
import 'package:flutter_pat_shop/util/constants.dart';
import 'package:intl/intl.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class GeneralInformationParagraph extends StatefulWidget {
  final Product product;
  GeneralInformationParagraph({Key? key, required this.product})
      : super(key: key);

  @override
  _GeneralInformationParagraphState createState() =>
      _GeneralInformationParagraphState();
}

class _GeneralInformationParagraphState
    extends State<GeneralInformationParagraph> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              buildSlideImageProduct(size),
              buildIndicator(size),
            ],
          ),
          _buildContent(),
        ],
      ),
    );
  }

  Widget buildSlideImageProduct(Size size) =>
      ScopedModelDescendant<ShowProductViewModel>(
        builder: (context, child, model) => CarouselSlider.builder(
          itemCount: widget.product.productImage,
          itemBuilder: (context, index, realIndex) {
            return Image.network(
              "$LINK_IMAGE_PRODUCT/${widget.product.productID}${index + 1}.png",
              fit: BoxFit.cover,
            );
          },
          options: CarouselOptions(
            height: size.height * 0.4,
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

  Widget _buildContent() => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  NumberFormat.currency(locale: 'vi', decimalDigits: 0)
                      .format(widget.product.productPrice),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                ScopedModelDescendant<ShowProductViewModel>(
                  builder: (context, child, model) => IconButton(
                    icon: Icon(
                      Icons.favorite,
                      size: 32,
                      color: model.isLike? Colors.red: Colors.grey,
                    ),
                    onPressed: () => model.updateIsLike(),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              widget.product.productName,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      SizedBox(
                        width: 4.0,
                      ),
                      Text(
                        widget.product.sumRate,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(
                        width: 4.0,
                      ),
                      Text(
                        "(${widget.product.countUser})",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey.shade500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                    width: 0.3,
                    child: Container(
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "${widget.product.countProductBill} Sale",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade400),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                    width: 0.3,
                    child: Container(
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_city,
                        color: Colors.amber,
                      ),
                      SizedBox(
                        width: 4.0,
                      ),
                      Text(
                        widget.product.manufacturerName,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade400),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      );
}
