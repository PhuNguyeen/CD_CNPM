import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/util/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocalIcon extends StatelessWidget {
  final String iconSrc;
  final Function() press;

  const SocalIcon({Key? key, required this.iconSrc, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: kPrimaryColor),
        shape: BoxShape.circle,
      ),
      child: GestureDetector(
        onTap: press,
        child: SvgPicture.asset(
          iconSrc,
          height: 20,
          width: 20,
        ),
      ),
    );
  }
}
