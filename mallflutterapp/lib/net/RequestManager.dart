import 'package:dio/dio.dart';

import 'BaseRequestEntity.dart';


/// 网络请求管理类
/// @author lizhid
/// @version V1.0.0
/// @date 2019/5/23
class RequestManager{

  /// get请求
  /// @author lizhid
  /// @modify
  /// @date 2019/5/23 15:26
  static void getHttp(BaseRequestEntity requestEntity) async{
    Dio dio = new Dio();
    dio.options.connectTimeout = 30000;
    dio.options.receiveTimeout = 30000;
    dio.options.sendTimeout = 30000;
    dio.options.baseUrl = 'http://apicloud.mob.com';
    Response response = await dio.get('/oil/price/province/query',queryParameters:requestEntity.toJson());
    print(response);
  }


  static void executeHttpRequest(BaseRequestEntity param,){

  }
}