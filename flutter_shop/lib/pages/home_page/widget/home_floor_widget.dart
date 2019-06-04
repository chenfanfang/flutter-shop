import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/home_page/model/home_page_model.dart';
import 'package:flutter_shop/tools/tool_screen.dart';
import '../home_page_Inherited_widget.dart';


class HomeFloorWidget extends StatelessWidget {
  List<HomePageGoodsModel> goodsList;
  HomePagePictureModel topBannerPicture;
  final int floorIndex;

//  HomeFloorWidget({@required this.goodsList, @required this.topBannerPicture});
  HomeFloorWidget({@required this.floorIndex});

  Widget _createCanClickImageWidget({@required HomePageGoodsModel model}) {

    return InkWell (
      onTap: () {
        print('点击了商品:${model.image}');
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

  Widget _createGoodsWidget() {

    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: _createCanClickImageWidget(model: this.goodsList[0]),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                _createCanClickImageWidget(model: this.goodsList[1]),
                _createCanClickImageWidget(model: this.goodsList[2]),
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
          _createGoodsWidget(),

        ],
      ),
    );
  }
}
