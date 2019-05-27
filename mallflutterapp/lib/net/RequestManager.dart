import 'dart:io';
import 'package:dio/dio.dart';

import '../entity_factory.dart';
import 'ApiHost.dart';
import 'BaseRequestEntity.dart';
import 'BaseResponseEntity.dart';
import 'RequestMethodEnum.dart';
import 'RequestTypeEnum.dart';

/// 网络请求管理类
/// @author lizhid
/// @version V1.0.0
/// @date 2019/5/23
class RequestManager {
  /// 网络请求类
  static Dio _dio;

  /// get请求
  /// @author lizhid
  /// @modify
  /// @date 2019/5/23 15:26
  static void getHttp(BaseRequestEntity requestEntity) async {
    if (_dio == null) {
      _dio = new Dio();
    }
    _dio.options.connectTimeout = 30000;
    _dio.options.receiveTimeout = 30000;
    _dio.options.sendTimeout = 30000;
    _dio.options.baseUrl = 'http://apicloud.mob.com';
    Response response = await _dio.get('/oil/price/province/query',
        queryParameters: requestEntity.toJson());
    print(response);
  }

  /// 网络请求
  /// @param requestType 请求类型
  /// @param needCache true:需要缓存，false：不需要缓存
  /// @param url 接口地址
  /// @param param 请求参数
  /// @param successCallback 请求成功回调
  /// @param methodType 请求类型
  /// @param contentType 内容类型json或表单
  /// @param head 请求头
  /// @param baseUrl 服务器地址
  /// @param responseType 响应类型
  /// @param errorCallBack 请求失败回调
  /// @return void
  /// @author lizhid
  /// @modify
  /// @date 2019/5/24 15:15
  static void httpRequest<T>(RequestTypeEnum requestType, bool needCache,
      String url, Function successCallback,
      {BaseRequestEntity param,
      RequestMethodEnum methodType,
      ContentType contentType,
      Map<String, dynamic> head,
      String baseUrl,
      ResponseType responseType,
      Function errorCallBack}) async {
    if (requestType == null) {
      return;
    }
    if (url == null) {
      return;
    }
    if (param == null) {
      param = new BaseRequestEntity();
    }

    /// 初始化dio
    _initDio(contentType: contentType, head: head, baseUrl: baseUrl);

    /// 执行请求
    _executeRequestPrepare<T>(requestType, needCache, url, param, successCallback,
        methodType: methodType, errorCallBack: errorCallBack);
  }

  /// 初始化dio
  /// @param contentType 请求类型
  /// @param head 请求头
  /// @param baseUrl 服务器地址
  /// @param responseType 响应类型
  /// @param errorCallBack 错误回调
  /// @return void
  /// @author lizhid
  /// @modify
  /// @date 2019/5/24 15:58
  static void _initDio(
      {ContentType contentType,
      Map<String, dynamic> head,
      String baseUrl,
      ResponseType responseType,
      Function errorCallBack}) {
    try {
      if (_dio == null) {
        _dio = new Dio();
      }
      if (head == null) {
        head = new Map<String, dynamic>();
      }
      baseUrl = baseUrl == null ? ApiHost.SERVER_URL : baseUrl;
      contentType = contentType == null ? ContentType.json : contentType;
      responseType = responseType == null ? ResponseType.json : responseType;
      _dio.options.baseUrl = baseUrl;
      _dio.options.connectTimeout = 30000;
      _dio.options.sendTimeout = 30000;
      _dio.options.receiveTimeout = 30000;
      _dio.options.contentType = contentType;
    } catch (e) {
      _handleException(e, errorCallBack);
    }
  }

  /// 请求
  /// @param requestType 请求类型
  /// @param needCache true:需要缓存，false：不需要缓存
  /// @param url 接口地址
  /// @param param 请求参数
  /// @param successCallback 请求成功回调
  /// @param methodType 请求类型
  /// @param errorCallBack 请求失败回调
  /// @return void
  /// @author lizhid
  /// @modify
  /// @date 2019/5/24 16:48
  static void _executeRequestPrepare<T>(
      RequestTypeEnum requestType,
      bool needCache,
      String url,
      BaseRequestEntity param,
      Function successCallback,
      {RequestMethodEnum methodType,
      Function errorCallBack}) {
    switch (requestType) {
      case RequestTypeEnum.NET:
        _executeRequest<T>(requestType, needCache, url, param, successCallback,
            methodType: methodType, errorCallBack: errorCallBack);
        break;
      case RequestTypeEnum.CACHE_AND_NET:
        _requestCache<T>(url, param, successCallback,
            errorCallBack: errorCallBack);
        _executeRequest<T>(requestType, needCache, url, param, successCallback,
            methodType: methodType, errorCallBack: errorCallBack);
        break;
      case RequestTypeEnum.CACHE_OR_NET:
        bool hasCache = _requestCache<T>(url, param, successCallback,
            errorCallBack: errorCallBack);
        if (!hasCache) {
          _executeRequest<T>(requestType, needCache, url, param, successCallback,
              methodType: methodType, errorCallBack: errorCallBack);
        }
        break;
      case RequestTypeEnum.CACHE:
        _requestCache<T>(url, param, successCallback,
            errorCallBack: errorCallBack);
        break;
    }
  }

  /// 请求
  /// @param requestType 请求类型
  /// @param needCache true:需要缓存，false：不需要缓存
  /// @param url 接口地址
  /// @param param 请求参数
  /// @param successCallback 请求成功回调
  /// @param errorCallBack 请求失败回调
  /// @return bool true:有缓存，false:无缓存
  /// @author lizhid
  /// @modify
  /// @date 2019/5/24 16:48
  static bool _requestCache<T>(
      String url, BaseRequestEntity param, Function successCallback,
      {Function errorCallBack}) {
    ///TODO:取缓存
    successCallback(null);
    return false;
  }

  /// 请求
  /// @param requestType 请求类型
  /// @param needCache true:需要缓存，false：不需要缓存
  /// @param url 接口地址
  /// @param param 请求参数
  /// @param successCallback 请求成功回调
  /// @param methodType 请求类型
  /// @param errorCallBack 请求失败回调
  /// @return void
  /// @author lizhid
  /// @modify
  /// @date 2019/5/24 16:48
  static void _executeRequest<T>(RequestTypeEnum requestType, bool needCache,
      String url, BaseRequestEntity param, Function successCallback,
      {RequestMethodEnum methodType, Function errorCallBack}) async {
    /// 请求方法选择
    methodType = methodType == null ? RequestMethodEnum.POST : methodType;

    /// 响应数据
    Response<Map<String, dynamic>> response;
    try {
      switch (methodType) {
        case RequestMethodEnum.GET:
          print(param.toJson());
          response = await _dio.get(url, queryParameters: param.toJson());
          break;
        case RequestMethodEnum.POST:
          response = await _dio.post(url, data: param.toJson());
          break;
        case RequestMethodEnum.PUT:
          response = await _dio.put(url, data: param.toJson());
          break;
        case RequestMethodEnum.DELETE:
          response = await _dio.put(url, data: param.toJson());
          break;
      }
      _handleResponse<T>(url, param, needCache, response, successCallback);
    } catch (e) {
      print(e);
    }
  }

  /// 处理响应数据
  /// @param url 请求地址
  /// @param param 请求参数
  /// @param needCache 是否需要缓存
  /// @param response 响应数据
  /// @param successCallback 请求成功回调
  /// @param errorCallBack 请求失败回调
  /// @return T
  /// @author lizhid
  /// @modify
  /// @date 2019/5/27 14:42
  static void _handleResponse<T>(String url, BaseRequestEntity param,
      bool needCache, Response response, Function successCallback,
      {Function errorCallBack}) {
    if (response == null) {
      return;
    }
    if (response.statusCode != HttpStatus.ok) {
      return;
    }
    Map<String, dynamic> responseData = response.data;
    if (responseData == null) {
      return;
    }

    /// 判断服务器响应码
    BaseResponseEntity<T> responseEntity = BaseResponseEntity.fromJson(responseData);
    if (responseEntity != null) {
      responseEntity.requestUrl = url;
      if ("success" == responseEntity.msg) {
        if (needCache) {
          _saveCache(url, param, responseData);
        }
        successCallback(responseEntity);
      } else {
        /// 请求失败
      }
    }
  }

  /// 异常统一处理
  /// @param e
  /// @param errorCallBack
  /// @return
  /// @author lizhid
  /// @modify
  /// @date 2019/5/27 17:22
  static void _handleException(Exception e, Function errorCallBack) {
    if (e == null) {
      return;
    }
  }

  /// 保存缓存
  /// @param url 请求地址
  /// @param param 参数
  /// @param responseBody 响应数据
  /// @return void
  /// @author lizhid
  /// @modify
  /// @date 2019/5/24 17:30
  static void _saveCache(
      String url, BaseRequestEntity param, dynamic responseBody) {
    if (responseBody == null) {
      return;
    }

    ///TODO:保存缓存
  }
}
