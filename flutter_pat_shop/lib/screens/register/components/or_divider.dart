import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/constants.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.02 * size.height),
      child: Container(
        width: size.width * 0.8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildDivider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                " Or ",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            buildDivider(),
          ],
        ),
      ),
    );
  }

  Expanded buildDivider() {
    return Expanded(
        child: Divider(
          height: 1.5,
          color: Colors.black,
        ));
  }
}
