import 'package:flutter_pat_shop/model/option/product_color/product_color.dart';
import 'package:flutter_pat_shop/model/option/ram_rom/ram_rom.dart';

abstract class OptionRepo {
  Future<Map<List<RamRom>, List<ProductColor>>> getOptionByProductID(
      int productID);

  dispose();
}
