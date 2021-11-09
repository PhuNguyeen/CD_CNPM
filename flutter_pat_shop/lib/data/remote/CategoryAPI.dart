import 'dart:convert';

import 'package:flutter_pat_shop/model/category/category.dart';
import 'package:flutter_pat_shop/util/constants.dart';
import 'package:http/http.dart' as http;

class CategoryAPI {
  Future<List<Category>?> getAllCategory() async {
    Uri apiLink = Uri.parse("$LINK_API/category");
    var response;
    try {
      response = await http.get(apiLink);
    } on Exception {
      print("Http exception");
      return null;
    }
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
        List<dynamic> jsonList = json['data'];
        List<Category> listCategory = [];
        for (var i = 0; i < jsonList.length; i++) {
          listCategory.add(Category.fromJson(jsonList[i]));
        }
    }
    return null;
  }
}
