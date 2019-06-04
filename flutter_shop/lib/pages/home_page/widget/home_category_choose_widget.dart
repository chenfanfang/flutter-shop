import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/home_page/model/home_page_model.dart';
import 'package:flutter_shop/tools/tool_screen.dart';

/// 首页选择分类的小部件
class HomeCategoryChooseWidget extends StatelessWidget {
  final List<HomePageCategoryModel> categoryModelList;
  final int crossAxisCount = 5;
  final double itemWidth = fitPx(uiWidth / 5.0);


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
              width: itemWidth * 0.8,
            ),
            SizedBox(
              height: fitPx(5),
            ),
            Text(categoryModel.mallCategoryName),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double childAspectRatio = 0.8;
    int rows = this.categoryModelList.length ~/ crossAxisCount;
    double padding = fitPx(3.0);
    rows =
        this.categoryModelList.length % crossAxisCount == 0 ? rows : rows + 1;
    double height = itemWidth / 0.8 * rows  + padding * 2;

    return Container(
      height: height,
      width: fitPx(uiWidth),
      margin: EdgeInsets.only(top: fitPx(5)),
      padding: EdgeInsets.all(padding),
      child: GridView.count(
        crossAxisCount: 5,
        childAspectRatio: childAspectRatio,
        physics: NeverScrollableScrollPhysics(), //禁止滚动
        children: this.categoryModelList.map((HomePageCategoryModel model) {
          return _createGridViewItem(context, model);
        }).toList(),
      ),
    );
  }
}
