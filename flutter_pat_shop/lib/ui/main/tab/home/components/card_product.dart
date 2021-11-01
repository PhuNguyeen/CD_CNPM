import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/util/constants.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

import 'package:flutter_pat_shop/model/product/product.dart';

class CardProduct extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  CardProduct({Key? key, required this.product, required this.onTap})
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
            Image.network(
              "$LINK_IMAGE_PRODUCT/${product.productID}1.png",
              width: MediaQuery.of(context).size.width * 0.43,
              height: MediaQuery.of(context).size.width * 0.35,
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
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    NumberFormat.currency(locale: 'vi', decimalDigits: 0)
                        .format(int.parse(product.productPrice??"100000000")),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    "(${product.countProductBill})",
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
                    size: 14,
                  ),
                  Text(
                    "${product.manufacturerName}",
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
                    rating: double.parse(product.sumRate),
                    itemSize: 12,
                    direction: Axis.horizontal,
                    itemCount: 5,
                  ),
                  Text(
                    "(${product.countUser})",
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
