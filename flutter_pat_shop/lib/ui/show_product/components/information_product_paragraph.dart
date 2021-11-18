import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/ui/show_product/components/text_head_show_product.dart';
import 'package:flutter_pat_shop/ui/show_product/show_product_viewmodel.dart';
import 'package:scoped_model/scoped_model.dart';

class InformationProductParagraph extends StatelessWidget {
  const InformationProductParagraph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: ScopedModelDescendant<ShowProductViewModel>(
        builder: (context, child, model) => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextHeadShowProduct(
              text: "Information",
            ),
            SizedBox(
              height: 16,
            ),
            model.specifications == null
                ? Container()
                : Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        buildRowInformation(
                            "Screen", "${model.specifications!.screen}"),
                        buildRowInformation("Font Camera",
                            "${model.specifications!.fontCamera}"),
                        buildRowInformation("Rear Camera",
                            "${model.specifications!.rearCamera}"),
                        buildRowInformation(
                            "Cpu", "${model.specifications!.cpu}"),
                        buildRowInformation(
                            "Sim Slot", "${model.specifications!.simSlot}"),
                        buildRowInformation(
                            "Battery", "${model.specifications!.battery}"),
                        buildRowInformation(
                            "Design", "${model.specifications!.design}"),
                        buildRowInformation("Especially",
                            "${model.specifications!.especially}"),
                      ],
                    ),
                  )
          ],
        ),
      ),
    );
  }

  Widget buildRowInformation(String name, String info) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              flex: 6,
              child: Text(
                info,
              ),
            ),
          ],
        ),
      );
}
