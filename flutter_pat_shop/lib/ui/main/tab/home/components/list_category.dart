import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/model/category/category.dart';
import 'package:flutter_pat_shop/util/constants.dart';
import 'package:flutter_pat_shop/util/my_snack_bar.dart';
import 'package:http/http.dart' as http;

class CategoryProduct extends StatefulWidget {
  const CategoryProduct({Key? key}) : super(key: key);

  @override
  _CategoryProductState createState() => _CategoryProductState();
}

class _CategoryProductState extends State<CategoryProduct> {
  List<Category> listCategory = [];
  bool isLoaded = false;

  @override
  void dispose() {
    isLoaded = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!isLoaded) {
      loadCategory();
    }
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: GridView.builder(
        itemCount: listCategory.length,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemBuilder: (context, index) {
          return listCategory.length == 0
              ? Container()
              : buildItemCategory(category: listCategory[index]);
        },
      ),
    );
  }

  Widget buildItemCategory({required Category category}) {
    return InkWell(
      onTap: () {
        //TODO đến danh sách theo từng loại
      },
      borderRadius: BorderRadius.circular(100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            LINK_AVATAR_CATEGORY + category.categoryAvatar,
            fit: BoxFit.fill,
            errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
            width: 40,
            height: 40,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "${category.categoryName}",
            style: TextStyle(color: Colors.orange, fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }

  loadCategory() async {
    Uri apiLink = Uri.parse(LINK_API + "category/read.php");
    var response = await http.get(apiLink);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      if (json['message']
          .toString()
          .toUpperCase()
          .contains("Have data".toUpperCase())) {
        List<dynamic> jsonList = json['data']['Category'];
        listCategory = [];
        for (var i = 0; i < jsonList.length; i++) {
          listCategory.add(Category.fromJson(jsonList[i]));
        }
        if (mounted) {
          setState(() {
            isLoaded = true;
            print("Load category successful!");
          });
        }
      } else {
        MySnackBar.snackBar("Error!", context);
        print("Error");
      }
    } else {
      print("Error query!");
      MySnackBar.snackBar("Error!", context);
    }
  }
}
