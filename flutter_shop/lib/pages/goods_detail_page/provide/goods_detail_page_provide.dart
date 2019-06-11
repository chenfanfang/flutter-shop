//flutter
import 'package:flutter/material.dart';

//model
import '../model/goods_detail_page_model.dart';

export 'package:flutter/material.dart';
export '../model/goods_detail_page_model.dart';
export 'package:provide/provide.dart';


class GoodsDetailPageProvide extends ChangeNotifier {
  GoodsDetailPageModel goodsDetailPageModel;

  void updateGoodsDetailPageModel(GoodsDetailPageModel model) {
    this.goodsDetailPageModel = model;
    this.notify();
  }

  void notify() {
    notifyListeners();
  }
}
