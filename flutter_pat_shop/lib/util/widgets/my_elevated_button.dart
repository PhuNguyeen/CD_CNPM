import 'package:flutter/material.dart';

class MyElevatedButton extends StatelessWidget {
  final Color color;
  final VoidCallback onPressed;
  final double height;
  final double? width;
  final Widget? child;
  final EdgeInsets? magin;
  final BorderRadiusGeometry? borderRadius;

  MyElevatedButton({
    Key? key,
    required this.height,
    this.width,
    this.magin,
    required this.onPressed,
    this.child,
    this.borderRadius,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: magin,
      height: height,
      child: RawMaterialButton(
        shape: RoundedRectangleBorder(borderRadius: borderRadius!),
        onPressed: onPressed,
        child: Center(
          child: child,
        ),
      ),
      decoration: BoxDecoration(
          color: color.withOpacity(0.4),
          borderRadius: borderRadius,
          boxShadow: [
            BoxShadow(
                color: color.withOpacity(0.4),
                offset: Offset(1, -2),
                blurRadius: 5),
            BoxShadow(
                color: color.withOpacity(0.4),
                offset: Offset(-1, 2),
                blurRadius: 5)
          ]),
    );
  }
}
