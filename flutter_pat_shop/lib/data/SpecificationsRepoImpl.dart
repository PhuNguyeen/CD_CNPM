import 'package:flutter_pat_shop/data/remote/SpecificationsAPI.dart';
import 'package:flutter_pat_shop/model/specifications/specifications.dart';
import 'package:flutter_pat_shop/repo/SpecificationsRepo.dart';

class SpecificationsRepoImpl with SpecificationsRepo{
  static SpecificationsRepo? instance;

  static SpecificationsRepo getInstance(){
    if(instance == null){
      instance = SpecificationsRepoImpl();
    }
    return instance!;
  }

  SpecificationsAPI specificationsAPI = SpecificationsAPI();
  @override
  dispose() {
   instance = null;
  }

  @override
  Future<Specifications?> getSpecificationsByProductID(int productID)async {
    return await specificationsAPI.getSpecificationsByProductID(productID);
  }

}