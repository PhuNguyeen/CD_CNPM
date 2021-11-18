import 'package:flutter_pat_shop/model/specifications/specifications.dart';

abstract class SpecificationsRepo{
  Future<Specifications?> getSpecificationsByProductID(int productID);

  dispose();
}