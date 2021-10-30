import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/ui/show_product/components/text_head_show_product.dart';

class InformationProductParagraph extends StatelessWidget {
  const InformationProductParagraph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextHeadShowProduct(
            text: "Information",
          ),
          SizedBox(
            height: 16,
          ),
          buildRowInformation("aáasdf", "àdasa"),
          buildRowInformation("aadfas", "afasdf"),
          buildRowInformation("ầa", "aàd"),
          buildRowInformation("aàddsaf", "ádfsadfa"),
        ],
      ),
    );
  }

  Widget buildRowInformation(String name, String info) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name),
          Text(info),
        ],
      );
}
