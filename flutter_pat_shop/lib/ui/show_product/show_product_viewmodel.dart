import 'package:flutter_pat_shop/data/SpecificationsRepoImpl.dart';
import 'package:flutter_pat_shop/model/product/product.dart';
import 'package:flutter_pat_shop/model/specifications/specifications.dart';
import 'package:flutter_pat_shop/repo/SpecificationsRepo.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:flutter_pat_shop/data/OptionRepoImpl.dart';
import 'package:flutter_pat_shop/data/ProductRepoImpl.dart';
import 'package:flutter_pat_shop/model/option/product_color/product_color.dart';
import 'package:flutter_pat_shop/model/option/ram_rom/ram_rom.dart';
import 'package:flutter_pat_shop/repo/OptionRepo.dart';
import 'package:flutter_pat_shop/repo/ProductRepo.dart';

class ShowProductViewModel extends Model {
  static ShowProductViewModel? _instance;
  final Product product;

  ShowProductViewModel(this.product) {
    initShowProductViewModel();
  }

  static getInstance(Product product) {
    if (_instance == null) {
      _instance = ShowProductViewModel(product);
    }
    return _instance;
  }

  ProductRepo productRepo = ProductRepoImpl.getInstance();
  OptionRepo optionRepo = OptionRepoImpl.getInstance();
  SpecificationsRepo specificationsRepo = SpecificationsRepoImpl.getInstance();

  bool isLike = false;
  List<RamRom> ramRoms = [];
  List<ProductColor> productColors = [];
  List<Product> relatedProducts = [];
  List<bool> isSelectRamRoms = [];
  List<bool> isSelectColors = [];
  int indexSelectedRamRom = 0;
  int indexSelectedColors = 0;
  int produtPrice = 0;
  Specifications? specifications;

  void updateIsLike() async {
    isLike = !isLike;

    notifyListeners();
  }

  void initShowProductViewModel() async {
    Map<List<RamRom>, List<ProductColor>> option =
        await optionRepo.getOptionByProductID(product.productID);
    updateListRamRom(option);
    updateListColor(option);
    updatePriceProduct();
    updateSpecifications();
    updateRelatedProducts();
    notifyListeners();
  }

  void updateListRamRom(Map<List<RamRom>, List<ProductColor>> option) {
    ramRoms = option.keys.first;
    isSelectRamRoms.add(true);
    for (int i = 1; i < ramRoms.length; i++) {
      isSelectRamRoms.add(false);
    }
  }

  updateIsSelectedRamRom(int index) {
    if (index == indexSelectedRamRom) return;
    isSelectRamRoms[index] = true;
    isSelectRamRoms[indexSelectedRamRom] = false;
    indexSelectedRamRom = index;
    updatePriceProduct();
    notifyListeners();
  }

  void updateListColor(Map<List<RamRom>, List<ProductColor>> option) {
    productColors = option.values.first;
    isSelectColors.add(true);
    for (int i = 1; i < productColors.length; i++) {
      isSelectColors.add(false);
    }
  }

  void updateIsSelectedColor(int index) {
    if (index == indexSelectedColors) return;
    isSelectColors[index] = true;
    isSelectColors[indexSelectedColors] = false;
    indexSelectedColors = index;
    updatePriceProduct();
    notifyListeners();
  }

  void updatePriceProduct() {
    produtPrice = ramRoms[indexSelectedRamRom].price +
        productColors[indexSelectedColors].price;
  }

  void updateSpecifications() async {
    this.specifications = await specificationsRepo.getSpecificationsByProductID(product.productID);
    notifyListeners();
  }

  void dispose() {
    productRepo.dispose();
    _instance = null;
  }

  void updateRelatedProducts() async{
    relatedProducts = await productRepo.getProductListByManufacturerID(product.manufacturerID)?? [];
    notifyListeners();
  }
}
