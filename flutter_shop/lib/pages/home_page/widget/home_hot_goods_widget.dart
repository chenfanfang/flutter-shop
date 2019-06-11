//flutter
import 'package:flutter/material.dart';

//model
import 'package:flutter_shop/pages/home_page/model/home_page_hot_goods_model.dart';

//inherited
import '../home_page_Inherited_widget.dart';

//page
import 'package:flutter_shop/pages/goods_detail_page/goods_detail_page.dart';

//tool
import 'package:flutter_shop/tools/all_tool.dart';

class HomeHotGoodsWidget extends StatelessWidget {
  List<HomePageHotGoodsModel> hotGoodsList;

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

  Widget _createHotGoodsListWidget(BuildContext context) {
    double itemWidth = screenWidth / 2.0;
    return Wrap(
      children: this.hotGoodsList.map((HomePageHotGoodsModel model) {
        return InkWell(
          onTap: () {
            GoodsDetailPage goodsDetailPage = GoodsDetailPage();
            push(context, goodsDetailPage);
          },
          child: Container(
            color: Colors.white,
            width: itemWidth,
            height: itemWidth + 70,
            child: Column(
              children: <Widget>[
                Image.network(model.image),
                Text(model.name),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(left: fitPx(20), right: fitPx(40)),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          '${model.mallPrice}',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '${model.price}',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    this.hotGoodsList = HomePageInheritedWidget.of(context).hotGoodsList;

    Container container;
    if (this.hotGoodsList != null) {
      container = Container(
        child: Column(
          children: <Widget>[
            _createHotTitleWidget(),
            _createHotGoodsListWidget(context),
          ],
        ),
      );
    } else {
      container = Container(
        height: 1,
      );
    }

    return container;
  }
}
