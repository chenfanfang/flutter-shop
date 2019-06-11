//flutter
import 'package:flutter/material.dart';
//tool
import 'package:flutter_shop/tools/all_tool.dart';
//model
import 'package:flutter_shop/pages/home_page/model/home_page_model.dart';
//inherited
import '../home_page_Inherited_widget.dart';
//page
import 'package:flutter_shop/pages/goods_detail_page/goods_detail_page.dart';

class HomeRecommendWidget extends StatelessWidget {
  List<HomePageRecommendModel> recommendsList;
//
//  HomeRecommendWidget({@required this.recommendsList});

  List<Widget> _createRecommendsWidgetList(BuildContext context,
      {@required double width, @required double height}) {
    return this.recommendsList.map((HomePageRecommendModel model) {
      return InkWell(
        onTap: () {
          GoodsDetailPage page = GoodsDetailPage(goodsId: model.goodsId);
          push(context, page);
        },

        child: Container(
          color: Colors.white,
          margin: EdgeInsets.only(top: fitPx(1), left: fitPx(1)),
          width: width,
          alignment: Alignment.topCenter,
          child: Column(
            children: <Widget>[
              Image.network(
                model.image,
                width: width,
                height: width,
              ),
              Text(
                '￥${model.mallPrice}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,

                ),
              ),
              Text(
                '￥${model.price}',
                style: TextStyle(
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {

    HomePageModel homePageModel = HomePageInheritedWidget.of(context).homePageModel;
    this.recommendsList = homePageModel.recommend;

    int columns = 2;
    double spacing = fitPx(10);
    double width = (screenWidth - spacing) / columns;

    return Container(
      child: Column(
        children: <Widget>[
          Container(
            color: Color.fromRGBO(244, 244, 244, 1),
            height: fitPx(10),
          ),
          Container(
            padding: EdgeInsets.only(left: fitPx(10.0)),
            alignment: Alignment.centerLeft,
            color: Colors.white,
            child: Text(
              '商品推荐',
              style: TextStyle(
                color: Colors.pink,
                fontSize: fitFontSize(15),
              ),
            ),
          ),
          Wrap(
            children: _createRecommendsWidgetList(context,width: width, height: width),
          ),
        ],
      ),
    );
  }
}
