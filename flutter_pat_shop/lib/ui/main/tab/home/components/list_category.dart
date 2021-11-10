import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/model/category/category.dart';
import 'package:flutter_pat_shop/ui/main/tab/home/home_tab_viewmodel.dart';
import 'package:flutter_pat_shop/util/constants.dart';
import 'package:scoped_model/scoped_model.dart';

class CategoryProduct extends StatefulWidget {
  const CategoryProduct({Key? key}) : super(key: key);

  @override
  _CategoryProductState createState() => _CategoryProductState();
}

class _CategoryProductState extends State<CategoryProduct> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<HomeTabViewModel>(
      builder: (context, child, model) => Container(
        margin: EdgeInsets.symmetric(vertical: 4),
        child: GridView.builder(
          itemCount: model.listCategory.length,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
          itemBuilder: (context, index) {
            return model.listCategory.length == 0
                ? Container()
                : buildItemCategory(category: model.listCategory[index]);
          },
        ),
      ),
    );
  }

  Widget buildItemCategory({required Category category}) {
    return InkWell(
      onTap: () {
        //TODO đến danh sách theo từng loại
      },
      borderRadius: BorderRadius.circular(100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            "$LINK_IMAGE_CATEGORY/${category.categoryImage}",
            fit: BoxFit.fill,
            errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
            width: 40,
            height: 40,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "${category.categoryName}",
            style: TextStyle(color: Colors.orange, fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }
}
