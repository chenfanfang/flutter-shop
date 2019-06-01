import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:convert'; //json

///////////////////////////////////////http base////////////////////////////////////////
enum HttpMethod {
  Get,
  Post,
}

String domain = "http://baixingliangfan.cn/baixing/";

class ToolHttp {
  static Future<HttpResponse> request(
      {String subUrl, HttpMethod method = HttpMethod.Get, Map params}) async {
    String fullUrl = domain + subUrl;
    try {
      Response response;
      Dio dio = Dio();

      switch (method) {
        case HttpMethod.Get:
          response = await dio.get(fullUrl, queryParameters: params);
          break;

        case HttpMethod.Post:
          response = await dio.post(fullUrl, queryParameters: params);
          break;

        default:
          break;
      }

      HttpResponse httpResp = HttpResponse.forResponse(response);
      return httpResp;
    } catch (e) {

      HttpResponse httpResp = HttpResponse.forException(e, fullUrl);
      return httpResp;
    }
  }
}

// 将Resonse数据包装成HttpResponse，方便点语法的使用
const int exceptionCode = -520;

class HttpResponse {
  bool success;
  int code;
  Map data;
  String errorMessage; //只有code == '-1'时才会有错误信息
  Response originResponse;
  var exception; //可能是exception 或者是error
  String api;

  HttpResponse.forResponse(Response response) {

    if(response.statusCode == 200) {
      this.originResponse = response;
      Map data = json.decode(response.data.toString());

      this.code = int.parse(data['code']);
      this.errorMessage = data['message'];
      this.data = data['data'];
      this.success = this.code == -1 ? false : true;
      this.api = response.request.path;
    }


  }

  HttpResponse.forException(e, String api) {
    this.exception = e;
    this.success = false;
    this.code = exceptionCode;
    this.errorMessage = 'http请求出现异常,异常详细信息请看:exception';
    this.api = api;
  }

  @override
  String toString() {


    String description ='\n'
        '=========================HttpResponse===========================\n'
        'api:         :${this.api}\n'
        'success      :${this.success}\n'
        'code         :${this.code}\n'
        'errorMessage :${this.errorMessage}\n'
        'exception    :${this.exception}\n'
        'data         :${this.data}\n'
        '================================================================\n';

    return description;
  }
}


