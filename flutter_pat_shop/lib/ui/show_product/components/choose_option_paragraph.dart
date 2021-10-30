import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/ui/show_product/components/text_head_show_product.dart';
import 'package:flutter_pat_shop/util/constants.dart';

class ChooseOptionParagraph extends StatefulWidget {
  const ChooseOptionParagraph({Key? key}) : super(key: key);

  @override
  _ChooseOptionParagraphState createState() => _ChooseOptionParagraphState();
}

class _ChooseOptionParagraphState extends State<ChooseOptionParagraph> {
  List<bool> isSelectRamRom = [true, false, false];
  List<bool> isSelectColor = [true, false, false];

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
          ToggleButtons(
            children: [
              buildItemToggleButtons("8/128"),
              buildItemToggleButtons("8/256"),
              buildItemToggleButtons("12/512"),
            ],
            isSelected: isSelectRamRom,
            renderBorder: true,
            borderRadius: BorderRadius.circular(50),
            fillColor: Colors.orange,
            selectedColor: Colors.white,
            onPressed: (index) {
              setState(() {
                for (var i = 0; i < isSelectRamRom.length; i++) {
                  if(i == index){
                    isSelectRamRom[i] = true;
                  }else{
                    isSelectRamRom[i] = false;
                  }
                }
              });
            },
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
          ToggleButtons(
            children: [
              buildItemToggleButtons("Red"),
              buildItemToggleButtons("Blue"),
              buildItemToggleButtons("Green"),
            ],
            isSelected: isSelectColor,
            renderBorder: true,
            borderRadius: BorderRadius.circular(50),
            fillColor: Colors.orange,
            selectedColor: Colors.white,
            onPressed: (index) {
              setState(() {
                for (var i = 0; i < isSelectColor.length; i++) {
                  if(i == index){
                    isSelectColor[i] = true;
                  }else{
                    isSelectColor[i] = false;
                  }
                }
              });
            },
          ),
        ],
      ),
    );
  }

  Widget buildItemToggleButtons(String label) => Container(
        child: Text(label),
        padding: EdgeInsets.symmetric(horizontal: 8),
      );
}
