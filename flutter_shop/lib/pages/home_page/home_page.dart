import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:async';
import 'package:flutter_shop/tools/tool_screen.dart';
import 'package:flutter_shop/tools/tool_http.dart';

class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    var params = {'lon':'115.02932','lat':'35.76189'};
    ToolHttp.http(subUrl: 'wxmini/homePageContent',method: HttpMethod.Post, params: params).then((HttpResponse resp) {

      print(resp);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter商城'),

      ),
      body: Center(
        child: Text('首页'),
      ),
    );
  }
}


