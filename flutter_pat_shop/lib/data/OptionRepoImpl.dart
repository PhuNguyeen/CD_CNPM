import 'package:flutter_pat_shop/data/remote/OptionAPI.dart';
import 'package:flutter_pat_shop/model/option/product_color/product_color.dart';
import 'package:flutter_pat_shop/model/option/ram_rom/ram_rom.dart';

import 'package:flutter_pat_shop/repo/OptionRepo.dart';

class OptionRepoImpl with OptionRepo {
  static OptionRepo? instance;

  static OptionRepo getInstance() {
    if (instance == null) {
      instance = OptionRepoImpl();
    }
    return instance!;
  }

  @override
  dispose() {
    instance = null;
  }

  OptionAPI optionAPI = OptionAPI();
  @override
  Future<Map<List<RamRom>, List<ProductColor>>> getOptionByProductID(int productID) async{
    return await optionAPI.getOptionByProductID(productID);
  }
}
