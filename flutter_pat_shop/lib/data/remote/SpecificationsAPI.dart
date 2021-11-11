import 'dart:convert';
import 'package:flutter_pat_shop/model/specifications/specifications.dart';
import 'package:flutter_pat_shop/util/constants.dart';
import 'package:http/http.dart' as http;

class SpecificationsAPI {
  Future<Specifications?> getSpecificationsByProductID(int productID) async {
    Uri apiLink = Uri.parse("$LINK_API/specifications/$productID");
    var response;
    try {
      response = await http.get(apiLink);
    } on Exception {
      print("Http error!");
      return null;
    }
    var json = jsonDecode(response.body);
    if (json['status']) {
      return Specifications.fromJson(json['data'][0]);
    } else
      return null;
  }
}
