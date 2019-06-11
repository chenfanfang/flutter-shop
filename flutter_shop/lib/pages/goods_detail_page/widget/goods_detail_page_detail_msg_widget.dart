//flutter
import 'package:flutter/material.dart';

//third
import 'package:flutter_html/flutter_html.dart';

//provide
import '../provide/goods_detail_page_provide.dart';

class GoodsDetailPageDetailMsgWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GoodsDetailPageProvide provide =
        Provide.value<GoodsDetailPageProvide>(context);
    String htmlString = provide.goodsDetailPageModel.goodsInfo.goodsDetail;
    //html这个库目前不支持  width="100%" height="auto"，
    //不支持  100%  和   auto的解析，所以直接将这个字眼给去掉即可
    htmlString = htmlString.replaceAll("width=\"100%\" height=\"auto\"", "");
    return Container(
      child: Html(data: htmlString),
    );
  }
}
