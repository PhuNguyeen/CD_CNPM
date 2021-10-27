import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/util/constants.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

import 'package:flutter_pat_shop/model/product/product.dart';

// ignore: must_be_immutable
class CardRecomendedProduct extends StatelessWidget {
  Product product;
  final VoidCallback onTap;

  CardRecomendedProduct({Key? key, required this.product, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 8.0,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 12,
            ),
            Image.network(
              LINK_IMAGE_PRODUCT_TEST,
              fit: BoxFit.fitWidth,
              errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
            ),
            SizedBox(
              height: 12,
            ),
            buildContentCardRecomendedProduct(),
          ],
        ),
      ),
    );
  }

  Widget buildContentCardRecomendedProduct() => Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                product.productName,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    NumberFormat.currency(locale: 'vi', decimalDigits: 0)
                        .format(10000000),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    "(200)",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_pin,
                    size: 16,
                  ),
                  Text(
                    "Ha Noi",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  RatingBarIndicator(
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    rating: 3,
                    itemSize: 16,
                    direction: Axis.horizontal,
                    itemCount: 5,
                  ),
                  Text(
                    "(2432)",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
}
