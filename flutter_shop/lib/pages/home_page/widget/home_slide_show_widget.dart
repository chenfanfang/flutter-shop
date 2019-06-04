import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_shop/pages/home_page/model/home_page_model.dart';
import 'package:flutter_shop/tools/tool_screen.dart';
import '../home_page_Inherited_widget.dart';


/// 首页轮播图 widget
class SlideShowWidget extends StatelessWidget {
   List<HomePageSlideModel> slideModelList;
//
//  SlideShowWidget({this.slideModelList});


  @override
  Widget build(BuildContext context) {
    HomePageModel homePageModel = HomePageInheritedWidget.of(context).homePageModel;
    this.slideModelList = homePageModel.slides;
    return Container(
        height: fitPx(180.0),
        child: Swiper(
          pagination: SwiperPagination(

          ),
          itemCount: slideModelList.length,
          itemBuilder: (BuildContext context, int index) {
            return Image.network(
              slideModelList[index].image,
              fit: BoxFit.cover,
            );
          },
        ));
  }
}
