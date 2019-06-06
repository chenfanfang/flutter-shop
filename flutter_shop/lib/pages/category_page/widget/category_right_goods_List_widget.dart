//flutter
import 'package:flutter/material.dart';

//model
import 'package:flutter_shop/pages/category_page/model/category_page_category_model.dart';

//tool
import 'package:flutter_shop/tools/all_tool.dart';

//provide
import 'package:provide/provide.dart';
import 'package:flutter_shop/pages/category_page/provide/category_page_provide.dart';

//model
import 'package:flutter_shop/pages/category_page/model/category_page_goods_model.dart';

//third
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';
import 'package:flutter_easyrefresh/ball_pulse_footer.dart';



class CategoryRightGoodsListWidget extends StatefulWidget {
  @override
  _CategoryRightGoodsListWidgetState createState() =>
      _CategoryRightGoodsListWidgetState();
}

class _CategoryRightGoodsListWidgetState
    extends State<CategoryRightGoodsListWidget> {
  GlobalKey<EasyRefreshState> _easyRefreshKey =
      new GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshHeaderState> _headerKey =
      new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey =
      new GlobalKey<RefreshFooterState>();

  //获取商品列表网络请求
  void _getCurrentCategoryGoodsList(CategoryPageProvide provide) async {
    CategoryPageSubCategoryModel subCategoryModel =
        provide.getCurrentSubCategoryModel();
    var params = {
      'page': 1,
      'categoryId': subCategoryModel.mallCategoryId,
      'categorySubId': subCategoryModel.mallSubId,
    };
    HttpsResponse response;
    response = await apiGetCurrentCategoryGoodsList(params: params);
    List data = response.data;
    List<CategoryPageGoodsModel> goodsList = data.map((item) {
      return CategoryPageGoodsModel.fromJson(item);
    }).toList();
    provide.updateGoodsModelList(goodsList);
  }

  Widget _createWrapItem(
      CategoryPageGoodsModel model, double width, BuildContext context) {
    return InkWell(
      onTap: () {

        ToolShowLoding.showLoading();
      },
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        color: Colors.white,
        width: width,
        height: width + 100,
        child: Column(
          children: <Widget>[
            Image.network(
              model.image,
              width: width,
            ),
            Container(
              height: 50,
              alignment: Alignment.centerLeft,
              child: Text(
                '${model.goodsName}',
                style: TextStyle(
                  color: Colors.pink,
                  fontSize: fitFontSize(13),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Row(
                children: <Widget>[
                  Text(
                    '${model.presentPrice}',
                    style: TextStyle(
                      fontSize: fitFontSize(12),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    '${model.oriPrice}',
                    style: TextStyle(
                      fontSize: fitFontSize(10),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //showDialog(context: context);

    return Provide<CategoryPageProvide>(
      builder: (context, child, provide) {
        List<CategoryPageGoodsModel> goodsList = provide.goodsModelList;

        if (goodsList.length == 0) {
          this._getCurrentCategoryGoodsList(provide);
        }
        return Expanded(
          child: LayoutBuilder(
            builder: (context2, boxConstrains) {
              final eachItemWidth = boxConstrains.maxWidth / 2.0;

              return EasyRefresh(
                key: _easyRefreshKey,
                limitScroll: true,
                refreshHeader: BallPulseHeader(
                  key: _headerKey,
                  color: Colors.pink,
                ),
                refreshFooter: BallPulseFooter(
                  key: _footerKey,
                  color: Colors.pink,
                ),
                onRefresh: () async {},
                loadMore: () async {},
                child: SingleChildScrollView(
                  child: Wrap(
                    children: goodsList.map((CategoryPageGoodsModel model) {
                      return _createWrapItem(model, eachItemWidth, context);
                    }).toList(),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
