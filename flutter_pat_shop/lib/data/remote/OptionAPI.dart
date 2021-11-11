import 'dart:convert';

import 'package:flutter_pat_shop/model/option/product_color/product_color.dart';
import 'package:flutter_pat_shop/model/option/ram_rom/ram_rom.dart';
import 'package:flutter_pat_shop/util/constants.dart';
import 'package:http/http.dart' as http;

class OptionAPI {
  Future<Map<List<RamRom>, List<ProductColor>>> getOptionByProductID(
      int productID) async {
    Uri apiLink = Uri.parse("$LINK_API/specifications/option/$productID");
    var response;
    try {
      response = await http.get(apiLink);
    } on Exception {
      print("Http error!");
      return {};
    }
    var json = jsonDecode(response.body);
    List<RamRom> ramRoms = [];
    List<ProductColor> productColors = [];
    if (json['status']) {
      List<dynamic> jsonRamRoms = json['data']['RamRom'];
      for (var i = 0; i < jsonRamRoms.length; i++) {
        ramRoms.add(RamRom.fromJson(jsonRamRoms[i]));
      }
      List<dynamic> jsonProductColors = json['data']['Color'];
      for (var i = 0; i < jsonProductColors.length; i++) {
        productColors.add(ProductColor.fromJson(jsonProductColors[i]));
      }
    }
    return {ramRoms: productColors};
  }
}
