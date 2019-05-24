import 'dart:io';

import 'package:dio/dio.dart';

import 'ApiHost.dart';
import 'BaseRequestEntity.dart';
import 'BaseResponseEntity.dart';
import 'MallException.dart';
import 'MallExceptionTypeEnum.dart';
import 'RequestCallBack.dart';
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
  /// @param requestCallBack 请求回调
  /// @param methodType 请求类型
  /// @param contentType 内容类型json或表单
  /// @param head 请求头
  /// @param baseUrl 服务器地址
  /// @param responseType 响应类型
  /// @return void
  /// @author lizhid
  /// @modify
  /// @date 2019/5/24 15:15
  static Future<T> httpRequest(RequestTypeEnum requestType,
      bool needCache,
      String url,
      BaseRequestEntity param,
      RequestCallBack<BaseResponseEntity> requestCallBack,
      {RequestMethodEnum methodType,
        ContentType contentType,
        Map<String, dynamic> head,
        String baseUrl,
        ResponseType responseType}) async {
    if (responseType == null) {
      return;
    }
    if (url == null) {
      return;
    }
    if (param == null) {
      param = new BaseRequestEntity();
    }
    if (requestCallBack == null) {
      return;
    }

    /// 初始化dio
    initDio(contentType: contentType, head: head, baseUrl: baseUrl);

    /// 执行请求
    executeRequestPrepare(requestType, needCache, url, param, requestCallBack,
        methodType: methodType);
  }

  /// 初始化dio
  /// @param contentType 请求类型
  /// @param head 请求头
  /// @param baseUrl 服务器地址
  /// @param responseType 响应类型
  /// @return void
  /// @author lizhid
  /// @modify
  /// @date 2019/5/24 15:58
  static void initDio({ContentType contentType,
    Map<String, dynamic> head,
    String baseUrl,
    ResponseType responseType}) {
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
  }

  /// 请求
  /// @param requestType 请求类型
  /// @param needCache true:需要缓存，false：不需要缓存
  /// @param url 接口地址
  /// @param param 请求参数
  /// @param requestCallBack 请求回调
  /// @return void
  /// @author lizhid
  /// @modify
  /// @date 2019/5/24 16:48
  static void executeRequestPrepare(RequestTypeEnum requestType,
      bool needCache,
      String url,
      BaseRequestEntity param,
      RequestCallBack<BaseResponseEntity> requestCallBack,
      {RequestMethodEnum methodType}) {
    switch (requestType) {
      case RequestTypeEnum.NET:
        executeRequest(requestType, needCache, url, param, requestCallBack,
            methodType: methodType);
        break;
      case RequestTypeEnum.CACHE_AND_NET:
        requestCache(url, param, requestCallBack);
        executeRequest(requestType, needCache, url, param, requestCallBack,
            methodType: methodType);
        break;
      case RequestTypeEnum.CACHE_OR_NET:
        bool hasCache = requestCache(url, param, requestCallBack);
        if (!hasCache) {
          executeRequest(requestType, needCache, url, param, requestCallBack,
              methodType: methodType);
        }
        break;
      case RequestTypeEnum.CACHE:
        requestCache(url, param, requestCallBack);
        break;
    }
  }

  /// 请求
  /// @param requestType 请求类型
  /// @param needCache true:需要缓存，false：不需要缓存
  /// @param url 接口地址
  /// @param param 请求参数
  /// @param requestCallBack 请求回调
  /// @return bool true:有缓存，false:无缓存
  /// @author lizhid
  /// @modify
  /// @date 2019/5/24 16:48
  static bool requestCache(String url,
      BaseRequestEntity param,
      RequestCallBack<BaseResponseEntity> requestCallBack,) {
    ///TODO:取缓存
    return false;
  }

  /// 请求
  /// @param requestType 请求类型
  /// @param needCache true:需要缓存，false：不需要缓存
  /// @param url 接口地址
  /// @param param 请求参数
  /// @param requestCallBack 请求回调
  /// @return void
  /// @author lizhid
  /// @modify
  /// @date 2019/5/24 16:48
  static void executeRequest(RequestTypeEnum requestType,
      bool needCache,
      String url,
      BaseRequestEntity param,
      RequestCallBack<BaseResponseEntity> requestCallBack,
      {RequestMethodEnum methodType}) async {
    /// 请求方法选择
    methodType = methodType == null ? RequestMethodEnum.POST : methodType;

    /// 响应数据
    Response response;
    try {
      switch (methodType) {
        case RequestMethodEnum.GET:
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
      if (response == null) {
        requestCallBack.onError(new MallException(
            MallExceptionTypeEnum.NET_ERROR_11, 1101, "网络繁忙，请稍后再试"), url);
        return;
      }

      if (response.statusCode != HttpStatus.ok) {
        requestCallBack.onError(new MallException(
            MallExceptionTypeEnum.NET_ERROR_11, response.statusCode,
            "网络繁忙，请稍后再试"), url);
      }

      /// TODO:判断服务器响应码
      if (needCache) {
        saveCache(url, param, response.data);
      }

      print(response);
    } catch (e) {
      print(e);
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
  static void saveCache(String url, BaseRequestEntity param,
      String responseBody) {
    if (responseBody == null) {
      return;
    }

    ///TODO:保存缓存
  }
}