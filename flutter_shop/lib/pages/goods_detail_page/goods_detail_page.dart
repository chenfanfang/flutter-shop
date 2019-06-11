//flutter
import 'package:flutter/material.dart';

//widget
import 'widget/goods_detail_page_bottom_btn_widget.dart';
import 'widget/goods_detail_page_top_Info_widget.dart';
import 'widget/goods_detail_page_detail_msg_widget.dart';

//tool
import 'package:flutter_shop/tools/all_tool.dart';

//provide
import 'package:flutter_shop/pages/goods_detail_page/provide/goods_detail_page_provide.dart';
import 'package:provide/provide.dart';

class GoodsDetailPage extends StatefulWidget {
  GoodsDetailPage({this.goodsId});

  @override
  _GoodsDetailPageState createState() => _GoodsDetailPageState();

  final String goodsId;
}

class _GoodsDetailPageState extends State<GoodsDetailPage> {
  String goodsName;

  final GoodsDetailPageProvide goodsDetailPageProvide =
      GoodsDetailPageProvide();
  final Providers providers = Providers();

  /// 加载详情页数据
  Future loadGoodsDetailData() async {
    ToolShowLoding.showLoading();
    var params = {'goodId': widget.goodsId};
    HttpsResponse response;
    response = await apiGetGoodsDetailData(params: params);
    GoodsDetailPageModel goodsDetailPageModel =
        GoodsDetailPageModel.fromJson(response.data);

    this.goodsName = goodsDetailPageModel.goodsInfo.goodsName;
    this
        .goodsDetailPageProvide
        .updateGoodsDetailPageModel(goodsDetailPageModel);

    setState(() {});
    ToolShowLoding.dismissLoading();
  }

  @override
  void initState() {
    this.goodsName = "加载中...";
    // TODO: implement initState
    super.initState();
    this.providers.provide(
        Provider<GoodsDetailPageProvide>.value(this.goodsDetailPageProvide));
    this.loadGoodsDetailData();
  }

  @override
  Widget build(BuildContext context) {
    if (this.goodsDetailPageProvide.goodsDetailPageModel == null) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            '${this.goodsName}',
            style: TextStyle(fontSize: fitPx(14.0)),
          ),
        ),
        body: Container(
          color: Colors.white,
          child: Center(

          ),
        ),
      );
    }

    final double bottomBtnHeight = fitPx(50);

    return ProviderNode(
      providers: this.providers,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '${this.goodsName}',
            style: TextStyle(fontSize: fitPx(14.0)),
          ),
        ),
        body: SafeArea(
          child: Container(

            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: bottomBtnHeight),
                  child: ListView(

                    children: <Widget>[
                      GoodsDetailPageTopInfoWidget(), //头部商品基本信息
                      GoodsDetailPageDetailMsgWidget(), //信息信息，html
                    ],
                  ),
                ),
                Positioned(
                  //底部的按钮
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  height: bottomBtnHeight,
                  child: GoodsDetailPageBottomBtnWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
