import 'dart:convert';

import 'package:flutter_pat_shop/model/product/product.dart';
import 'package:flutter_pat_shop/util/constants.dart';
import 'package:http/http.dart' as http;

class ProductAPI {
  Future<List<Product>?> getRecomendedProduct(int page, int limit) async {
    Uri apiLink = Uri.parse("$LINK_API/product?limit=$limit&page=$page");
    var response;
    try {
      response = await http.get(apiLink);
    } on Exception {
      print("Http error!");
      return null;
    }
    var json = jsonDecode(response.body);
    List<Product> listProduct = [];
    if (json['status']) {
      List<dynamic> jsonListProduct = json['data'];
      for (var i = 0; i < jsonListProduct.length; i++) {
        listProduct.add(Product.fromJson(jsonListProduct[i]));
      }
      return listProduct;
    }
  }

  Future<List<Product>?> getCategoryProduct(
      int page, int limit, int idCategory) async {
    // TODO: call list sản phẩm theo từng loại
    Uri apiLink = Uri.parse("$LINK_API/product?limit=$limit&page=$page");
    var response;
    try {
      response = await http.get(apiLink);
    } on Exception {
      print("Http error!");
      return null;
    }
    var json = jsonDecode(response.body);
    List<Product> listProduct = [];
    if (json['status']) {
      List<dynamic> jsonListProduct = json['data'];
      for (var i = 0; i < jsonListProduct.length; i++) {
        listProduct.add(Product.fromJson(jsonListProduct[i]));
      }
      return listProduct;
    }
  }

  Future<String?> getDescriptionProduct(int idProduct) async {
    // TODO: lấy description của sản phẩm
    Uri apiLink = Uri.parse("$LINK_API/product?");
    var response;
    try {
      response = await http.get(apiLink);
    } on Exception {
      print("Http error!");
      return null;
    }
    var json = jsonDecode(response.body);
    String description = "";
    if (json['status']) {}
    return description;
  }
}

Future<List<Product>?> getInformationProduct(int idProduct) async {
  //TODO: lấy bảng thông số kĩ thuật của snar phẩm
  Uri apiLink = Uri.parse("$LINK_API/product?");
  var response;
  try {
    response = await http.get(apiLink);
  } on Exception {
    print("Http error!");
    return null;
  }
  var json = jsonDecode(response.body);
  
  if (json['status']) {
    
    return null;
  }
}
