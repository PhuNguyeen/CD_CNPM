import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/ui/product_list_by_id_category/component/body_product_list_by_id_categogy.dart';
import 'package:flutter_pat_shop/ui/product_list_by_id_category/product_list_by_id_categogy_viewmodel.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductListByIdCategogyScreen extends StatefulWidget {
  final int idCategory;
  final String categoryName;
  const ProductListByIdCategogyScreen(
      {Key? key, required this.idCategory, required this.categoryName})
      : super(key: key);

  @override
  _ProductListByIdCategogyScreenState createState() => _ProductListByIdCategogyScreenState();
}

class _ProductListByIdCategogyScreenState extends State<ProductListByIdCategogyScreen> {
  ProductListByIdCategoryViewModel? productListByIdCategoryViewModel;
  @override
  Widget build(BuildContext context) {
    productListByIdCategoryViewModel =
        ProductListByIdCategoryViewModel.getInstance(widget.idCategory);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(
            Icons.search,
            color: Colors.grey.shade200,
          ),
          SizedBox(
            width: 20,
          ),
        ],
        title: Text(widget.categoryName),
      ),
      body: ScopedModel<ProductListByIdCategoryViewModel>(
        model: productListByIdCategoryViewModel!,
        child: BodyProductListByIdCategory(),
      ),
    );
  }
  @override
  void dispose() {
    if(productListByIdCategoryViewModel != null){
      productListByIdCategoryViewModel!.dispose();
    }
    
    super.dispose();
  }
}
