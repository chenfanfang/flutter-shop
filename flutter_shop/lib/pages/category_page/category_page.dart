
import 'package:flutter/material.dart';
import 'package:flutter_shop/tools/tool_http.dart';
import 'package:flutter_shop/tools/tool_http_all_api.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  //====================================网络请求相关=======================================begin

  void getCategoryData() async {
    HttpsResponse response;
    response = await apiGetCategoryData();
    debugPrint('$response');


  }

  //====================================网络请求相关=======================================end


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    this.getCategoryData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('分类'),
      ),
      body: Center(
        child: Text('分类333'),
      ),
    );
  }
}
