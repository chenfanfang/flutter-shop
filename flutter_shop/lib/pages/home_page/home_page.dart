import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_shop/tools/tool_screen.dart';
import 'package:flutter_shop/pages/home_page/model/home_page_model.dart';
import 'package:flutter_shop/tools/tool_http_all_api.dart';
import 'package:flutter_shop/pages/home_page/widget/home_slide_show_widget.dart';
import 'package:flutter_shop/tools/tool_http.dart';
import 'package:flutter_shop/pages/home_page/widget/home_category_choose_widget.dart';
import 'package:flutter_shop/pages/home_page/widget/home_ad_banner_widget.dart';

/// 首页
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  HomePageModel homePageModel;

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter商城'),
      ),
      body: FutureBuilder(
          future: getHomeData(),
          builder:
              (BuildContext context, AsyncSnapshot<HttpResponse> snapshot) {
            if (snapshot.hasData) {
              HttpResponse resp = snapshot.data;
              this.homePageModel = HomePageModel.fromJson(resp.data);
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SlideShowWidget(
                      slideModelList: this.homePageModel.slides,
                    ),
                    HomeCategoryChooseWidget(
                        categoryModelList: this.homePageModel.category),
                    HomeAdBannerWidget(
                      bannerModel: this.homePageModel.advertesPicture,
                      shopInfoModel: this.homePageModel.shopInfo,
                    )
                  ],
                ),
              );
            } else {
              return Center(
                child: Text('加载中...'),
              );
            }
          }),
    );
  }
}
