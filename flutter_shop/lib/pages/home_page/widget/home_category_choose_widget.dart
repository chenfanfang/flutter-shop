import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/home_page/model/home_page_model.dart';
import 'package:flutter_shop/tools/tool_screen.dart';

/// 首页选择分类的小部件
class HomeCategoryChooseWidget extends StatelessWidget {
  final List<HomePageCategoryModel> categoryModelList;

  HomeCategoryChooseWidget({@required this.categoryModelList});

  Widget _createGridViewItem(
      BuildContext context, HomePageCategoryModel categoryModel) {
    return InkWell(
      onTap: () {
        print('点击了分类选项');
      },
      child: Container(
        child: Column(
          children: <Widget>[
            Image.network(
              categoryModel.image,
              width: ToolScreen.width(95),
            ),
            Text(categoryModel.mallCategoryName),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = 5;
    int rows = this.categoryModelList.length ~/ crossAxisCount;
    rows =
        this.categoryModelList.length % crossAxisCount == 0 ? rows : rows + 1;


    double height = ToolScreen.height(250.0 * rows);
    return Container(
      height: ToolScreen.height(height),
      width: ToolScreen.width(750.0),
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(3.0),
      child: GridView.count(
        crossAxisCount: 5,
        childAspectRatio: 0.8,
        physics: NeverScrollableScrollPhysics(),
        children: this.categoryModelList.map((HomePageCategoryModel model) {
          return _createGridViewItem(context, model);
        }).toList(),
      ),
    );
  }
}
