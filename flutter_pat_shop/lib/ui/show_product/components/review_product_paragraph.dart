import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/model/product/product.dart';
import 'package:flutter_pat_shop/ui/show_product/components/review_line.dart';
import 'package:flutter_pat_shop/ui/show_product/components/text_head_show_product.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewProductParagraph extends StatelessWidget {
  final Product product;
  const ReviewProductParagraph({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16, top: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextHeadShowProduct(text: "Review"),
              TextButton(
                onPressed: () {},
                child: Text(
                  "View All",
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: Row(
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
                "(${product.countProductBill})",
                style: TextStyle(color: Colors.grey.shade400),
              ),
            ],
          ),
        ),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context, index) => ReviewLine(),
        ),
      ],
    );
  }
}
