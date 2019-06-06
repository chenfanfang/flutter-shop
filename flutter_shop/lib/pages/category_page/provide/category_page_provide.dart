//flutter
import 'package:flutter/material.dart';

//model
import 'package:flutter_shop/pages/category_page/model/category_page_category_model.dart';
import 'package:flutter_shop/pages/category_page/model/category_page_goods_model.dart';

class CategoryPageProvide extends ChangeNotifier {

  List<CategoryPageMainCategoryModel> mainCategoryModelList = [];
  int mainCategoryIndex = 0;
  int subCategoryIndex = 0;
  List<CategoryPageGoodsModel> goodsModelList = [];


  void updateGoodsModelList(List<CategoryPageGoodsModel> goodsModelList) {
    this.goodsModelList = goodsModelList;
    if(this.goodsModelList == null) {
      this.goodsModelList = [];
    }
    this.notify();
  }

  void updateMainCategoryModelList(List<CategoryPageMainCategoryModel> mainCategoryModelList) {
    this.mainCategoryModelList = mainCategoryModelList;
    if(this.mainCategoryModelList == null) {
      this.mainCategoryModelList = [];
    }
    this.notify();
  }

  void updateMainCategoryIndex(int index) {
    if(index == this.mainCategoryIndex) {
      return;
    }
    this.mainCategoryIndex = index;
    this.subCategoryIndex = 0;
    this.goodsModelList = [];
    this.notify();
  }

  void updateSubCategoryIndex(int index) {
    if(index == this.subCategoryIndex) {
      return;
    }
    this.subCategoryIndex = index;
    this.goodsModelList = [];
    this.notify();
  }

  CategoryPageMainCategoryModel getCurrentMainCategoryModel() {
    return this.mainCategoryModelList[this.mainCategoryIndex];
  }

  CategoryPageSubCategoryModel getCurrentSubCategoryModel() {
    CategoryPageMainCategoryModel mainCategoryModel = this.getCurrentMainCategoryModel();
    return mainCategoryModel.bxMallSubDto[this.subCategoryIndex];
  }




  void notify() {
    notifyListeners();
  }

}