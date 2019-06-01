import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_shop/tools/tool_screen.dart';
import 'home_page_model.dart';
import 'package:flutter_shop/tools/tool_http_all_api.dart';
import 'package:flutter_shop/custom_widget/slide_show_widget.dart';
import 'package:flutter_shop/tools/tool_http.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageModel homePageModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter商城'),

      ),
      body: FutureBuilder(
          future: getHomeData(),
          builder: (BuildContext context, AsyncSnapshot<HttpResponse> snapshot) {
            if(snapshot.hasData) {
              HttpResponse resp = snapshot.data;
              this.homePageModel = HomePageModel.fromJson(resp.data);
              return SlideShowWidget(
                slideModelList: this.homePageModel.slides,
              );
            }
            else {
              return Center(
                child: Text('加载中...'),
              );
            }
          }),
    );
  }
}

