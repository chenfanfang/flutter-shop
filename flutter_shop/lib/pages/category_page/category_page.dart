//flutter
import 'package:flutter/material.dart';

//third
import 'package:provide/provide.dart';

//tool
import 'package:flutter_shop/tools/tool_http.dart';
import 'package:flutter_shop/tools/tool_http_all_api.dart';
import 'package:flutter_shop/tools/tool_screen.dart';

//model
import 'package:flutter_shop/pages/category_page/model/category_page_category_model.dart';
import 'package:flutter_shop/pages/category_page/provide/category_page_provide.dart';

//widget
import 'package:flutter_shop/pages/category_page/widget/category_left_category_widget.dart';
import 'package:flutter_shop/pages/category_page/widget/category_right_goods_List_widget.dart';
import 'package:flutter_shop/pages/category_page/widget/category_right_top_category_widget.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final CategoryPageProvide categoryPageProvide = CategoryPageProvide();
  final Providers providers = Providers();

  //====================================网络请求相关=======================================begin

  void getCategoryData() async {
    HttpsResponse response;
    response = await apiGetCategoryData();

    if (response.success = false) return;

    List data = response.data;

    List mainCategoryList = data.map((mapData) {
      return CategoryPageMainCategoryModel.fromJson(mapData);
    }).toList();


    this.categoryPageProvide.updateMainCategoryModelList(mainCategoryList);
    setState(() {});
  }

  //====================================网络请求相关=======================================end

  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    this.providers.provide(Provider<CategoryPageProvide>.value(this.categoryPageProvide));

    this.getCategoryData();
  }

  @override
  Widget build(BuildContext context) {
    if (this.categoryPageProvide.mainCategoryModelList.length == 0) {
      return Container(
        child: Center(
          child: Text('加载中....'),
        ),
      );
    }

    final leftCategoryWidth = fitPx(100);

    return ProviderNode(
      child: Scaffold(
        appBar: AppBar(
          title: Text('分类'),
        ),
        body: Row(
          children: <Widget>[
            Container(
              width: leftCategoryWidth,
              child: CategoryLeftCategoryWidget(),
            ),
            Container(
              color: Colors.white,
              width: screenWidth - leftCategoryWidth,
              child: Column(
                children: <Widget>[
                  CategoryRightTopCategoryWidget(),
                  CategoryRightGoodsListWidget(),
                ],
              ),
            )
          ],
        ),
      ),
      providers: providers,
    );
  }
}
