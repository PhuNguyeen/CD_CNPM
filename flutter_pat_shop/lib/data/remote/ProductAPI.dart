import 'dart:convert';

import 'package:flutter_pat_shop/model/product/product.dart';
import 'package:flutter_pat_shop/util/constants.dart';
import 'package:http/http.dart' as http;

class ProductAPI {
  Future<List<Product>?> getRecomendedProduct(int start, int limit) async {
    Uri apiLink = Uri.parse("$LINK_API/product/read_limit.php?start=$start&limit=$limit");
    var response;
    try {
      response = await http.get(apiLink);
    } on Exception {
      print("Http error!");
      return null;
    }
    List<Product> listProduct = [];
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      if (json['message']
          .toString()
          .toUpperCase()
          .contains("Have data".toUpperCase())) {
        List<dynamic> jsonListProduct = json['data']['Product'];
        for (var i = 0; i < jsonListProduct.length; i++) {
          listProduct.add(Product.fromJson(jsonListProduct[i]));
        }
        return listProduct;
      }
      return listProduct;
    }
  }
}
