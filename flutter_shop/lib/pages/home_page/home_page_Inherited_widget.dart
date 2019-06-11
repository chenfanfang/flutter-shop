//flutter
import 'package:flutter/material.dart';
//model
import 'package:flutter_shop/pages/home_page/model/home_page_model.dart';
import 'package:flutter_shop/pages/home_page/model/home_page_hot_goods_model.dart';
//page
import 'package:flutter_shop/pages/goods_detail_page/goods_detail_page.dart';

class HomePageInheritedWidget extends InheritedWidget {
  final HomePageModel homePageModel;
  final List<HomePageHotGoodsModel> hotGoodsList;

  const HomePageInheritedWidget({
    Key key,
    @required this.homePageModel,
    @required this.hotGoodsList,
    @required Widget child,
  }) : super(key: key, child: child);


  static HomePageInheritedWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(HomePageInheritedWidget);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }
}

