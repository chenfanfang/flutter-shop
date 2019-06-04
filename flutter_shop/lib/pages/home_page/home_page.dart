import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_shop/tools/tool_screen.dart';

//third
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_easyrefresh/material_footer.dart';

//tool
import 'package:flutter_shop/tools/tool_http_all_api.dart';
import 'package:flutter_shop/tools/tool_http.dart';

//widget
import 'package:flutter_shop/pages/home_page/widget/home_slide_show_widget.dart';
import 'package:flutter_shop/pages/home_page/widget/home_category_choose_widget.dart';
import 'package:flutter_shop/pages/home_page/widget/home_ad_banner_widget.dart';
import 'package:flutter_shop/pages/home_page/widget/home_recommend_widget.dart';
import 'package:flutter_shop/pages/home_page/widget/home_floor_widget.dart';
import 'package:flutter_shop/pages/home_page/widget/home_hot_goods_widget.dart';

//model
import 'package:flutter_shop/pages/home_page/model/home_page_model.dart';
import 'package:flutter_shop/pages/home_page/model/home_page_hot_goods_model.dart';

//InheritedWidget
import 'package:flutter_shop/pages/home_page/home_page_Inherited_widget.dart';

/// 首页
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  HomePageModel homePageModel;
  List<HomePageHotGoodsModel> hotGoodsList;
  int hotGoodsPage = 1;

  GlobalKey<EasyRefreshState> _easyRefreshKey =
  new GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshHeaderState> _headerKey =
  new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey =
  new GlobalKey<RefreshFooterState>();


  //所有的字widget
  final List<Widget> childrenWidget = [
    Column(
      children: <Widget>[
        SlideShowWidget(
          //slideModelList: this.homePageModel.slides,
        ),
        HomeCategoryChooseWidget(
          // categoryModelList: this.homePageModel.category,
        ),
        HomeAdBannerWidget(
          //bannerModel: this.homePageModel.advertesPicture,
          //shopInfoModel: this.homePageModel.shopInfo,
        ),
        HomeRecommendWidget(
          //recommendsList: this.homePageModel.recommend,
        ),
        HomeFloorWidget(
          floorIndex: 1,
          //goodsList: this.homePageModel.floor1,
          //topBannerPicture: this.homePageModel.floor1Pic,
        ),
        HomeFloorWidget(
          floorIndex: 2,
          //goodsList: this.homePageModel.floor2,
          //topBannerPicture: this.homePageModel.floor2Pic,
        ),
        HomeFloorWidget(
          floorIndex: 3,
          //goodsList: this.homePageModel.floor3,
          //topBannerPicture: this.homePageModel.floor3Pic,
        ),

        HomeHotGoodsWidget(
          //hotGoodsList: this.hotGoodsList,
        ),
      ],
    ),



  ];


  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  Future loadAllHomeData() async {
    await Future.wait([loadHotData(), loadHomeData()]);
    setState(() {

    });

    return true;
  }

  // 加载热门商品数据
  Future loadHotData() async {
    HttpResponse response;
    response = await getHomeHotGoodsData(page: this.hotGoodsPage);

    if (response.data != null) {
      if (this.hotGoodsPage == 1) {
        this.hotGoodsList = List<HomePageHotGoodsModel>();
      }

      List listData = response.data;
      listData.forEach((value) {
        HomePageHotGoodsModel model = HomePageHotGoodsModel.fromJson(value);
        this.hotGoodsList.add(model);
      });

      this.hotGoodsPage++;
    }

    return true;
  }

  //加载首页数据
  Future loadHomeData() async {
    HttpResponse response;
    response = await getHomeData();

    if (response.success) {
      this.homePageModel = HomePageModel.fromJson(response.data);
    }

    return true;
  }

  Widget _createHomeWidget() {
    //没数据先显示加载中
    if (this.homePageModel == null) {
      return Center(
        child: Text('加载数据中...'),
      );
    }

    //有数据则直接显示子widget
    return HomePageInheritedWidget(
      homePageModel: this.homePageModel,
      hotGoodsList: this.hotGoodsList,
      child: EasyRefresh(
        key: _easyRefreshKey,
        refreshHeader: MaterialHeader(key: _headerKey),
        refreshFooter: MaterialFooter(key: _footerKey),
        onRefresh: () async {
          await loadAllHomeData();
        },
        loadMore: () async {
          await loadHotData();
          setState(() {

          });
        },
        child: ListView(
            children: this.childrenWidget,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    this.loadAllHomeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter商城'),
        ),
        body: Container(
          child: _createHomeWidget(),
        ));
  }
}

///FutureBuilder
/*
* @override
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
                    ),
                    HomeRecommendWidget(
                      recommendsList: this.homePageModel.recommend,
                    ),
                    HomeFloorWidget(
                      goodsList: this.homePageModel.floor1,
                      topBannerPicture: this.homePageModel.floor1Pic,
                    ),
                    HomeFloorWidget(
                      goodsList: this.homePageModel.floor2,
                      topBannerPicture: this.homePageModel.floor2Pic,
                    ),
                    HomeFloorWidget(
                      goodsList: this.homePageModel.floor3,
                      topBannerPicture: this.homePageModel.floor3Pic,
                    ),
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
* */
