import 'package:provide/provide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/category_page/model/category_page_category_model.dart';

class CategoryPageProvide extends ChangeNotifier {

  List<CategoryPageMainCategoryModel> mainCategoryModelList;
  int mainCategoryIndex = 0;

  void updateMainCategoryIndex(int index) {
    this.mainCategoryIndex = index;
    this.notify();
  }

  void updateMainCategoryModelList(List<CategoryPageMainCategoryModel> mainCategoryModelList) {
    this.mainCategoryModelList = mainCategoryModelList;
    this.notify();
  }

  void notify() {
    notifyListeners();
  }

}