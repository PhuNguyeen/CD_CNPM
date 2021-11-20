import 'package:flutter/material.dart';
import 'package:flutter_pat_shop/ui/search_product/components/body_search_screen.dart';
import 'package:flutter_pat_shop/ui/search_product/search_viewmodel.dart';
import 'package:scoped_model/scoped_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SearchViewModel searchViewModel = SearchViewModel.getInstance();
  @override
  Widget build(BuildContext context) {
    return ScopedModel<SearchViewModel>(
      model: searchViewModel,
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.white,
          ),
          title: buildSearchBar(),
        ),
        body: BodySearchScreen(),
      ),
    );
  }

  Widget buildSearchBar() {
    TextEditingController controller = TextEditingController();
    return ScopedModelDescendant<SearchViewModel>(
      builder: (context, child, model) => Container(
        width: MediaQuery.of(context).size.width,
        height: 40.0,
        child: TextField(
          controller: controller,
          textInputAction: TextInputAction.search,
          onSubmitted: (value) => model.searchProduct(),
          onChanged: (value) => model.updateContentSearch(value),
          autofocus: true,
          cursorColor: Colors.orange.shade900,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Colors.orange.shade900,
            ),
            border: InputBorder.none,
            suffixIcon: model.contentSearching.isNotEmpty
                ? GestureDetector(
                    onTap: () {
                      controller.clear();
                      model.updateContentSearch("");
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.orange.shade900,
                    ),
                  )
                : null,
            filled: true,
            hintText: "Tìm kiếm trong cửa hàng...",
            hintStyle: TextStyle(color: Colors.grey.shade400),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  void dispose() {
    searchViewModel.dispose();
    super.dispose();
  }
}
