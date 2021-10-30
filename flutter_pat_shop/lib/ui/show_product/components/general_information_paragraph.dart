import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class GeneralInformationParagraph extends StatefulWidget {
  const GeneralInformationParagraph({Key? key}) : super(key: key);

  @override
  _GeneralInformationParagraphState createState() => _GeneralInformationParagraphState();
}

class _GeneralInformationParagraphState extends State<GeneralInformationParagraph> {
  List<String> listImageProduct = [
    'assets/images/ads_demo1.jpg',
    'assets/images/ads_demo2.jpg',
    'assets/images/ads_demo3.jpg',
    'assets/images/ads_demo4.jpg',
    'assets/images/ads_demo5.jpg',
  ];
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

  Widget buildSlideImageProduct(Size size) => CarouselSlider.builder(
        itemCount: listImageProduct.length,
        itemBuilder: (context, index, realIndex) {
          return Image.asset(
            listImageProduct[index],
            fit: BoxFit.cover,
          );
        },
        options: CarouselOptions(
          height: size.height * 0.4,
          autoPlay: false,
          scrollPhysics: BouncingScrollPhysics(),
          initialPage: 1,
          viewportFraction: 1,
          onPageChanged: (index, reason) {
            setState(() {
              activeIndex = index;
            });
          },
        ),
      );

  Widget buildIndicator(Size size) => Positioned(
        width: size.width,
        bottom: 10,
        child: Center(
          child: AnimatedSmoothIndicator(
            activeIndex: activeIndex,
            count: listImageProduct.length,
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
                      .format(10000000),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                InkWell(
                  child: Icon(
                    Icons.favorite,
                    size: 32,
                    color: Colors.red,
                  ),
                  onTap: () {},
                ),
              ],
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              "Samsung Galaxy Z Fold3 5G",
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
                        "4.0",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(
                        width: 4.0,
                      ),
                      Text(
                        "(1062)",
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
                        "4797 Sale",
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
                        "Samsung",
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
