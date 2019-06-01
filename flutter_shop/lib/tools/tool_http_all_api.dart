import 'tool_http.dart';


Future<HttpResponse> getHomeData() async {
  var params = {'lon':'115.02932','lat':'35.76189'};

  HttpResponse response;
  response = await ToolHttp.request(subUrl: 'wxmini/homePageContent',method: HttpMethod.Post, params: params);

  return response;

}