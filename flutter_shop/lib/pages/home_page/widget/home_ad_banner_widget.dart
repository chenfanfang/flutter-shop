import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/home_page/model/home_page_model.dart';
import 'package:flutter_shop/tools/tool_screen.dart';
import 'package:url_launcher/url_launcher.dart';

/// 首页的广告显示模块和店铺信息电话模块 widget
class HomeAdBannerWidget extends StatelessWidget {
  final HomePagePictureModel bannerModel;
  final HomePageShopInfoModel shopInfoModel;
  HomeAdBannerWidget({@required this.bannerModel, @required this.shopInfoModel});

  //点击拨打电话
  void _callPhone() async {

    String url = 'tel:' + this.shopInfoModel.leaderPhone;
    print(url);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw '不能拨打电话 $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: fitPx(10),
            child: Container(
              color: Color.fromRGBO(240, 240, 240, 1),
            ),
          ),

          Container(
            child: Image.network(this.bannerModel.pICTUREADDRESS),
          ),

          Container(
            child: InkWell(
              onTap: _callPhone,
              child: Image.network(this.shopInfoModel.leaderImage),
            ),
          ),

        ],
      ),
    );
  }
}
