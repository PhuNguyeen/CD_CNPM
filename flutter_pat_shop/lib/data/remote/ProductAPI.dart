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
    Uri apiLink = Uri.parse("$LINK_API/product/category/$idCategory?limit=$limit&page=$page");
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
        print('ok');
      }
      return listProduct;
    }
  }

  Future<List<Product>?> getProductListByManufacturerID(int manufacturerID)async {
    Uri apiLink = Uri.parse("$LINK_API/product/manufacturer/$manufacturerID");
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

   Future<List<Product>?> findProductList(String content) async{
     Uri apiLink = Uri.parse("$LINK_API/product/$content");
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
}
