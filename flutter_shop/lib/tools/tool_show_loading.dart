import 'package:flutter/material.dart';

//third
import 'package:flutter_spinkit/flutter_spinkit.dart';

//是否已经在显示加载动画
bool isShowing = false;
BuildContext showLoadingContext;

class ToolShowLoding {

  ///只需要初始化一次即可
  static void init(BuildContext context) {
    if(showLoadingContext == null) {
      print('init context : $context');
      showLoadingContext = context;
    }
  }

  static void showLoading() async {
    print('showLoadingContext:$showLoadingContext');
    if (isShowing == true) return;
    isShowing = true;
    showDialog(
      barrierDismissible: false,
      context: showLoadingContext,
      builder: (context) {
        return Center(

          child: Container(
            width: 100,
            height: 100,
            color: Color.fromRGBO(50, 50, 50, 1),
            child: SpinKitFadingCircle(
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }

  static void dismissLoading() {
    if(isShowing == false) return;
    isShowing = false;
    Navigator.pop(showLoadingContext);
  }
}
