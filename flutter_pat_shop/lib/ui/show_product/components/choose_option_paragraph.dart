import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/model/option/product_color/product_color.dart';
import 'package:flutter_pat_shop/model/option/ram_rom/ram_rom.dart';
import 'package:flutter_pat_shop/ui/show_product/components/text_head_show_product.dart';
import 'package:flutter_pat_shop/ui/show_product/show_product_viewmodel.dart';
import 'package:scoped_model/scoped_model.dart';

class ChooseOptionParagraph extends StatefulWidget {
  const ChooseOptionParagraph({Key? key}) : super(key: key);

  @override
  _ChooseOptionParagraphState createState() => _ChooseOptionParagraphState();
}

class _ChooseOptionParagraphState extends State<ChooseOptionParagraph> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextHeadShowProduct(
            text: "Option",
          ),
          SizedBox(
            height: 16.0,
          ),
          Text(
            "Ram/Rom",
            style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 18,
                color: Colors.grey.shade500),
          ),
          SizedBox(
            height: 8.0,
          ),
          ScopedModelDescendant<ShowProductViewModel>(
            builder: (context, child, model) => ToggleButtons(
              children: buildListToggleButtonsRamRom(model.ramRoms),                
              isSelected: model.isSelectRamRoms,
              renderBorder: true,
              borderRadius: BorderRadius.circular(50),
              fillColor: Colors.orange,
              selectedColor: Colors.white,
              onPressed: (index) {
                model.updateIsSelectedRamRom(index);
              },
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          Text(
            "Color",
            style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 18,
                color: Colors.grey.shade500),
          ),
          SizedBox(
            height: 8.0,
          ),
          ScopedModelDescendant<ShowProductViewModel>(
            builder: (context, child, model) =>  ToggleButtons(
              children: buildListToggleButtonsColor(model.productColors),
              isSelected: model.isSelectColors,
              renderBorder: true,
              borderRadius: BorderRadius.circular(50),
              fillColor: Colors.orange,
              selectedColor: Colors.white,
              onPressed: (index) {
                model.updateIsSelectedColor(index);
              },
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildListToggleButtonsRamRom(List<RamRom> data) {
    List<Widget> listItem = []; 
    for(int i = 0; i< data.length; i++){
      listItem.add(Container(
        child: Text("${data[i].ramdetail}/${data[i].romDetail}"),
        padding: EdgeInsets.symmetric(horizontal: 8),
      ));
    }
    return listItem;
  }
  List<Widget> buildListToggleButtonsColor(List<ProductColor> data) {
    List<Widget> listItem = []; 
    for(int i = 0; i< data.length; i++){
      listItem.add(Container(
        child: Text("${data[i].colorName}"),
        padding: EdgeInsets.symmetric(horizontal: 8),
      ));
    }
    return listItem;
  }
}
