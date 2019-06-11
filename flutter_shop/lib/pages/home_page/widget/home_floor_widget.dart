//flutter
import 'package:flutter/material.dart';
//model
import 'package:flutter_shop/pages/home_page/model/home_page_model.dart';
//tool
import 'package:flutter_shop/tools/all_tool.dart';
//inherited
import '../home_page_Inherited_widget.dart';
//page
import 'package:flutter_shop/pages/goods_detail_page/goods_detail_page.dart';


class HomeFloorWidget extends StatelessWidget {
  List<HomePageGoodsModel> goodsList;
  HomePagePictureModel topBannerPicture;
  final int floorIndex;

//  HomeFloorWidget({@required this.goodsList, @required this.topBannerPicture});
  HomeFloorWidget({@required this.floorIndex});

  Widget _createCanClickImageWidget(BuildContext context,{@required HomePageGoodsModel model}) {

    return InkWell (
      onTap: () {
        GoodsDetailPage page = GoodsDetailPage(goodsId: model.goodsId);
        push(context, page);

      },
      child: Image.network(model.image),
    );
  }

  Widget _createTopBannerImageWidget() {
    return Container(
      color: Color.fromRGBO(240, 240, 240, 1),
      padding: EdgeInsets.only(left: fitPx(10),right: fitPx(10)),
      child: Image.network(
        this.topBannerPicture.pICTUREADDRESS,
        width: screenWidth,
      ),
    );
  }

  Widget _createGoodsWidget(BuildContext context) {

    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: _createCanClickImageWidget(context,model: this.goodsList[0]),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                _createCanClickImageWidget(context,model: this.goodsList[1]),
                _createCanClickImageWidget(context,model: this.goodsList[2]),
              ],
            ),
          )
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {


    final HomePageModel homePageModel = HomePageInheritedWidget.of(context).homePageModel;
    if(this.floorIndex == 1) {
      this.goodsList = homePageModel.floor1;
      this.topBannerPicture = homePageModel.floor1Pic;
    }
    else if(this.floorIndex == 2) {
      this.goodsList = homePageModel.floor2;
      this.topBannerPicture = homePageModel.floor2Pic;
    }
    else {
      this.goodsList = homePageModel.floor3;
      this.topBannerPicture = homePageModel.floor3Pic;
    }


    return Container(

      margin: EdgeInsets.only(top: fitPx(5.0)),
      child: Column(
        children: <Widget>[
          _createTopBannerImageWidget(),
          _createGoodsWidget(context),

        ],
      ),
    );
  }
}
