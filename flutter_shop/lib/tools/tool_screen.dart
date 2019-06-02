import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

const double uiWidth = 375.0;
const double uiHeight = 667.0;
double pxRatio;
MediaQueryData mediaQuery;

// 初始化UI设计师基于怎样的屏幕尺寸来设计的
// 一定在MaterialApp的home中的页面设置(即入口文件，只需设置一次),以保证在每次使用之前设置好了适配尺寸:
void initScreen(
    {@required BuildContext context}) {

  if(mediaQuery == null) {
    mediaQuery = MediaQuery.of(context);
    pxRatio = mediaQuery.size.width / uiWidth;
  }
//  _mediaQueryData = mediaQuery;
//  _pixelRatio = mediaQuery.devicePixelRatio;
//  _screenWidth = mediaQuery.size.width;
//  _screenHeight = mediaQuery.size.height;
//  _statusBarHeight = mediaQuery.padding.top;
//  _bottomBarHeight = _mediaQueryData.padding.bottom;
//  _textScaleFactor = mediaQuery.textScaleFactor;
}

//适配像素，基于屏幕宽度
double fitPx(double px) {


  return pxRatio * px;
}


double fitFontSize(double fontSize) {
  return ScreenUtil.getInstance().setSp(fontSize);
}
