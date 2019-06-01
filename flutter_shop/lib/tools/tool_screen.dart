import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class ToolScreen {

  //一定在MaterialApp的home中的页面设置(即入口文件，只需设置一次),以保证在每次使用之前设置好了适配尺寸:
  static void initScreen({@required BuildContext context,double width = 750, double height = 1334}) {
    ScreenUtil.instance = ScreenUtil(width: width, height: height)..init(context);
  }

  static double width(double width) {
    return ScreenUtil.getInstance().setWidth(width);
  }

  static double height(double height) {
    return ScreenUtil.getInstance().setHeight(height);
  }

  static double x(double x) {
    return ScreenUtil.getInstance().setWidth(x);
  }

  static double y(double y) {
    return ScreenUtil.getInstance().setHeight(y);
  }

  static double fontSize(double fontSize) {
    return ScreenUtil.getInstance().setSp(fontSize);
  }
}