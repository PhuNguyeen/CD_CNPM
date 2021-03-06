import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/util/my_snack_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class SliderADS extends StatefulWidget {
  const SliderADS({Key? key}) : super(key: key);

  @override
  _SliderADSState createState() => _SliderADSState();
}

class _SliderADSState extends State<SliderADS> {
  var activeIndex = 0;

  final listImageADS = [
    'assets/images/ads_demo1.png',
    'assets/images/ads_demo2.png',
    'assets/images/ads_demo3.png',
    'assets/images/ads_demo4.png',
    'assets/images/ads_demo5.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: listImageADS.length,
          itemBuilder: (context, index, realIndex) {
            final indexCurrent = index;
            return buildItemSlider(indexCurrent);
          },
          options: CarouselOptions(
            autoPlay: true,
            viewportFraction: 1,
            height: 280,
            autoPlayAnimationDuration: Duration(seconds: 1),
            onPageChanged: (index, reason) {
              setState(() {
                activeIndex = index;
              });
            },
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        buildIndicator(MediaQuery.of(context).size)
      ],
    );
  }

  Widget buildItemSlider(int index) {
    return GestureDetector(
      child: Image.asset(
        listImageADS[index],
        fit: BoxFit.fill,
      ),
      onTap: () {
        //TODO đi đến địa chỉ quảng cáo
        return MySnackBar.snackBar("$activeIndex", context);
      },
    );
  }

  Widget buildIndicator(Size size) => Positioned(
    bottom: 5.0,
    width: size.width,
    child: Center(
      child: AnimatedSmoothIndicator(
            activeIndex: activeIndex,
            count: listImageADS.length,
            effect: WormEffect(
              activeDotColor: Colors.orange,
              type: WormType.thin,
              dotWidth: 8,
              dotHeight: 8,
              paintStyle: PaintingStyle.fill,
              spacing: 4
            ),
          ),
    ),
  );
}
