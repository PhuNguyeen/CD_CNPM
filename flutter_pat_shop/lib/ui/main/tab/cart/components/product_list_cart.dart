import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/model/product/product.dart';
import 'package:flutter_pat_shop/util/constants.dart';
import 'package:intl/intl.dart';

class ProductListCart extends StatefulWidget {
  const ProductListCart({Key? key}) : super(key: key);

  @override
  _ProductListCartState createState() => _ProductListCartState();
}

class _ProductListCartState extends State<ProductListCart> {
  Product product = Product(
      productID: 1,
      productName: "iPhone 12 Pro Max",
      productImage: 1,
      productPrice: 0,
      manufacturerName: "Apple",
      manufacturerID: 1,
      countUser: 0,
      sumRate: "0",
      countProductBill: "0");
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) => CardProdutInCart(product: product),
      ),
    );
  }
}

class CardProdutInCart extends StatefulWidget {
  final Product product;
  CardProdutInCart({Key? key, required this.product}) : super(key: key);

  @override
  _CardProdutInCartState createState() => _CardProdutInCartState();
}

class _CardProdutInCartState extends State<CardProdutInCart> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 8.0,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              "$LINK_IMAGE_PRODUCT/${widget.product.productID}1.png",
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.width * 0.3,
              fit: BoxFit.fitWidth,
              errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.width * 0.3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${widget.product.productName}",
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  NumberFormat.currency(locale: 'vi', decimalDigits: 0)
                      .format(widget.product.productPrice),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          shape: BoxShape.rectangle,
                          border: Border.all(width: 1, color: Colors.grey),
                        ),
                        child: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                      onTap: () {},
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            padding: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                shape: BoxShape.rectangle,
                                color: Colors.teal),
                            child: Icon(Icons.remove, color: Colors.white),
                          ),
                          onTap: () {},
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("10"),
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            padding: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                shape: BoxShape.rectangle,
                                color: Colors.teal),
                            child: Icon(Icons.add, color: Colors.white),
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
