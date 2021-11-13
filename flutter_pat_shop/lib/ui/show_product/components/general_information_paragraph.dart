import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/model/product/product.dart';
import 'package:flutter_pat_shop/ui/show_product/show_product_viewmodel.dart';
import 'package:intl/intl.dart';
import 'package:scoped_model/scoped_model.dart';

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
    return Container(
      child: _buildContent(),
    );
  }

  Widget _buildContent() => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ScopedModelDescendant<ShowProductViewModel>(
                  builder: (context, child, model) => Text(
                    NumberFormat.currency(locale: 'vi', decimalDigits: 0)
                        .format(model.produtPrice),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                ScopedModelDescendant<ShowProductViewModel>(
                  builder: (context, child, model) => IconButton(
                    icon: Icon(
                      Icons.favorite,
                      size: 32,
                      color: model.isLike ? Colors.red : Colors.grey,
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
