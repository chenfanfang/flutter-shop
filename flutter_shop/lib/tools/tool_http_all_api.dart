import 'tool_http.dart';
export 'tool_http.dart';

/// 获取首页数据
Future<HttpsResponse> apiGetHomeData({Map<String, dynamic> params}) async {
  HttpsResponse response;
  response = await ToolHttp.request(
      subUrl: 'wxmini/homePageContent',
      method: HttpMethod.Post,
      params: params);
  return response;
}

/// 获取首页的热卖商品
Future<HttpsResponse> apiGetHomeHotGoodsData(
    {Map<String, dynamic> params}) async {
  HttpsResponse response;
  response = await ToolHttp.request(
      subUrl: 'wxmini/homePageBelowConten',
      method: HttpMethod.Post,
      params: params);
  return response;
}

/// 获取分类的数据
Future<HttpsResponse> apiGetCategoryData({Map<String, dynamic> params}) async {
  HttpsResponse response;
  response = await ToolHttp.request(
      subUrl: 'wxmini/getCategory', method: HttpMethod.Post, params: params);
  return response;
}

/// 获取当前分类中的商品列表数据
Future<HttpsResponse> apiGetCurrentCategoryGoodsList({
    Map<String, dynamic> params}) async {
  HttpsResponse response;
  response = await ToolHttp.request(
      subUrl: 'wxmini/getMallGoods', method: HttpMethod.Post, params: params);
  return response;
}


/// 获取当前分类中的商品列表数据
Future<HttpsResponse> apiGetGoodsDetailData({
  Map<String, dynamic> params}) async {
  HttpsResponse response;
  response = await ToolHttp.request(
      subUrl: 'wxmini/getGoodDetailById', method: HttpMethod.Post, params: params);
  return response;
}