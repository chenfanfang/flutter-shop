//flutter
import 'package:flutter/material.dart';

//third
import 'package:provide/provide.dart';

//provide
import 'package:flutter_shop/pages/category_page/provide/category_page_provide.dart';

//model
import 'package:flutter_shop/pages/category_page/model/category_page_category_model.dart';

/// 分类界面，左边的分类
class CategoryLeftCategoryWidget extends StatelessWidget {
  Widget _createListViewItem(CategoryPageMainCategoryModel model) {
    return Container(
      child: Text('${model.mallCategoryName}'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Provide<CategoryPageProvide>(
      builder: (context, child, categoryPageProvide) {
        return Container(
            child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return _createListViewItem(
                categoryPageProvide.mainCategoryModelList[index]);
          },
          itemCount: categoryPageProvide.mainCategoryModelList.length,
        ));
      },
    );
  }
}
