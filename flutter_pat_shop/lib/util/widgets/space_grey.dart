import 'package:flutter/material.dart';

class SpaceGrey extends StatelessWidget {
  final double? height;
  final Color? color;

  SpaceGrey({Key? key, this.height, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height?? 12,
      child: Container(
        color: color?? Colors.grey.shade200,
      ),
    );
  }
}
