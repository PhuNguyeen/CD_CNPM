import 'package:flutter_pat_shop/data/remote/CategoryAPI.dart';
import 'package:flutter_pat_shop/model/category/category.dart';
import 'package:flutter_pat_shop/repo/CategoryRepo.dart';

class CategoryRepoImpl with CategoryRepo{
  static CategoryRepo? instance;

  static CategoryRepo getInstance(){
    if(instance == null){
      instance = CategoryRepoImpl();
    }
    return instance!;
  }
  
  CategoryAPI categoryAPI = CategoryAPI();

  @override
  Future<List<Category>?> getAllCategory() async{
    List<Category>? listCategory = await categoryAPI.getAllCategory();
    return listCategory;
  }

}