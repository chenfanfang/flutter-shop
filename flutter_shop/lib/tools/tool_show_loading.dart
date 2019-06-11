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
    if (isShowing == true) return;
    isShowing = true;

    Future.delayed(Duration(microseconds: 50),(){
      showDialog(
        barrierDismissible: false,
        context: showLoadingContext,
        builder: (context) {
          return Center(

            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Color.fromRGBO(50, 50, 50, 1),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: SpinKitFadingCircle(
                color: Colors.white,
              ),
            ),
          );
        },
      );
    });
  }

  static void dismissLoading() {
    if(isShowing == false) return;
    isShowing = false;
    Navigator.pop(showLoadingContext);
  }
}
