//flutter
import 'package:flutter/material.dart';

//provide
import '../provide/goods_detail_page_provide.dart';

//Tool
import 'package:flutter_shop/tools/all_tool.dart';

/// 商品详情页头部 图片信息和商品基本信息
class GoodsDetailPageTopInfoWidget extends StatelessWidget {
  /// 商品图片
  Widget _createGoodsImageWidget(GoodsDetailPageModel model) {
    return Container(
      child: Image.network(
        '${model.goodsInfo.image1}',
        width: screenWidth,
      ),
    );
  }

  /// 商品基本信息（商品名、价格、编号等等）
  Widget _createGoodsInfoWidget(GoodsDetailPageModel model) {
    DetailGoodsPageGoodsInfoModel goodsInfoModel = model.goodsInfo;
    return Container(
      padding: EdgeInsets.only(left: 16.0, top: 16.0),
      child: Column(
        children: <Widget>[
          Container(
            //商品名称

            alignment: Alignment.topLeft,
            child: Text(
              '${goodsInfoModel.goodsName}',
              style: TextStyle(
                fontSize: fitPx(16.0),
              ),
            ),
          ),
          Container(
            //商品编号

            padding: EdgeInsets.only(
              top: 10.0,
            ),
            alignment: Alignment.topLeft,
            child: Text(
              '编号:${goodsInfoModel.goodsSerialNumber}',
              style: TextStyle(
                fontSize: fitPx(13),
                color: Colors.grey,
              ),
            ),
          ),
          Container(
            //商品价格

            height: fitPx(50.0),
            child: Row(
              children: <Widget>[
                Text(
                  //现价
                  '￥${goodsInfoModel.presentPrice}',
                  style: TextStyle(
                      fontSize: fitFontSize(18.0),
                      color: Colors.red,
                      fontWeight: FontWeight.w500),
                ),
                Container(
                  //市场价
                  padding: EdgeInsets.only(bottom: 5.0),
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 30,
                      ),
                      Text('市场价：'),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '￥${goodsInfoModel.presentPrice}',
                        style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 说明
  Widget _crateExplainWidget() {
    return Container(
      color: Color.fromRGBO(230, 230, 230, 1),
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(top: 10.0, bottom: 10.0,),
        color: Colors.white,
        width: screenWidth,
        height: fitPx(40),
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            '说明：> 极速送达 > 正品保证',
            style: TextStyle(
              fontSize: fitPx(13.0),
              color: Colors.orange,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    GoodsDetailPageProvide provide =
        Provide.value<GoodsDetailPageProvide>(context);
    GoodsDetailPageModel goodsDetailPageModel = provide.goodsDetailPageModel;
    return Container(
      child: Column(
        children: <Widget>[
          _createGoodsImageWidget(goodsDetailPageModel),
          _createGoodsInfoWidget(goodsDetailPageModel),
          _crateExplainWidget(),
        ],
      ),
    );
  }
}
