import 'package:flutter/material.dart';
import 'package:flutter_shop/tools/tool_screen.dart';
import 'package:flutter_shop/pages/home_page/model/home_page_hot_goods_model.dart';
import 'package:flutter_shop/tools/tool_screen.dart';



class HomeHotGoodsWidget extends StatelessWidget {
  final List<HomePageHotGoodsModel> hotGoodsList;

  HomeHotGoodsWidget({@required this.hotGoodsList});

  Widget _createHotTitleWidget() {
    return Container(
        alignment: Alignment.center,
        color: Color.fromRGBO(230, 230, 230, 1),
        height: fitPx(40.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.public,
              color: Colors.pink,
            ),
            SizedBox(
              width: fitPx(5),
            ),
            Text(
              '火爆专区',
              style: TextStyle(),
            ),
          ],
        ));
  }


  Widget _createHotGoodsListWidget() {

    double itemWidth = screenWidth / 2.0;
    return Wrap(
      children: this.hotGoodsList.map((HomePageHotGoodsModel model){

        return Container(
          width: itemWidth,
          height: itemWidth,
          color: Colors.blueAccent,
        );
      }).toList();
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _createHotTitleWidget(),
          _createHotGoodsListWidget(),
        ],
      ),
    );
  }
}
