//flutter
import 'package:flutter/material.dart';

//third
import 'package:provide/provide.dart';

//provide
import 'package:flutter_shop/pages/category_page/provide/category_page_provide.dart';

//model
import 'package:flutter_shop/pages/category_page/model/category_page_category_model.dart';

//tool
import 'package:flutter_shop/tools/tool_screen.dart';

/// 分类界面，左边的分类
class CategoryLeftCategoryWidget extends StatelessWidget {
  final borderColor = Color.fromRGBO(220, 220, 220, 1);

  Widget _createListViewItem(int categoryIndex, CategoryPageProvide provide) {
    CategoryPageMainCategoryModel model =
        provide.mainCategoryModelList[categoryIndex];
    Color bgColor = provide.mainCategoryIndex == categoryIndex
        ? Color.fromRGBO(240, 240, 240, 1)
        : Colors.white;
    return InkWell(
      onTap: () {
        provide.updateMainCategoryIndex(categoryIndex);
      },
      child: Container(
        padding: EdgeInsets.only(left: fitPx(10)),
        alignment: Alignment.centerLeft,
        height: fitPx(50),
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
            width: 1.0,
            color: borderColor,
          )),
          color: bgColor,
        ),
        child: Text('${model.mallCategoryName}'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Provide<CategoryPageProvide>(
      builder: (context, child, categoryPageProvide) {
        return Container(
            decoration: BoxDecoration(
                border: Border(
                    right: BorderSide(
              color: Color.fromRGBO(210, 210, 210, 1),
              width: 1.0,
            ))),
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return _createListViewItem(index, categoryPageProvide);
              },
              itemCount: categoryPageProvide.mainCategoryModelList.length,
            ));
      },
    );
  }
}
