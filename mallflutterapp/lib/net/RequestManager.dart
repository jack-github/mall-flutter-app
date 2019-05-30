import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mallflutterapp/common/MallToast.dart';
import 'package:mallflutterapp/net/MallException.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  /// @param needTip true:需要提示，默认提示
  /// @param debug true:调试模式，默认打开日志
  /// @return void
  /// @author lizhid
  /// @modify
  /// @date 2019/5/24 15:15
  static void httpRequest<T>(
      RequestTypeEnum requestType, bool needCache, String url,
      {Function(BaseResponseEntity<T>) successCallback,
      BaseRequestEntity param,
      RequestMethodEnum methodType,
      ContentType contentType,
      Map<String, dynamic> head,
      String baseUrl,
      ResponseType responseType,
      Function(MallException) errorCallBack,
      bool needTip = true,
      bool debug = true}) async {
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
    _initDio(
        contentType: contentType, head: head, baseUrl: baseUrl, debug: debug,needTip: needTip);

    /// 执行请求
    _executeRequestPrepare<T>(
        requestType, needCache, url, param, successCallback,
        methodType: methodType, errorCallBack: errorCallBack, needTip: needTip);
  }

  /// 初始化dio
  /// @param contentType 请求类型
  /// @param head 请求头
  /// @param baseUrl 服务器地址
  /// @param responseType 响应类型
  /// @param errorCallBack 错误回调
  /// @param debug true:调试模式
  /// @return void
  /// @author lizhid
  /// @modify
  /// @date 2019/5/24 15:58
  static void _initDio(
      {ContentType contentType,
      Map<String, dynamic> head,
      String baseUrl,
      ResponseType responseType,
      Function(MallException) errorCallBack,bool needTip,
      bool debug}) {
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
      if (debug) {
        _dio.interceptors.add(new LogInterceptor(
            requestBody: true, responseBody: true, error: true));
      }
    } catch (e) {
      _handleException(e, errorCallBack,needTip);
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
  /// @param needTip true:需要提示，默认提示
  /// @return void
  /// @author lizhid
  /// @modify
  /// @date 2019/5/24 16:48
  static void _executeRequestPrepare<T>(
      RequestTypeEnum requestType,
      bool needCache,
      String url,
      BaseRequestEntity param,
      Function(BaseResponseEntity<T>) successCallback,
      {RequestMethodEnum methodType,
      Function(MallException) errorCallBack,
      bool needTip}) {
    switch (requestType) {
      case RequestTypeEnum.NET:
        _executeRequest<T>(requestType, needCache, url, param, successCallback,
            methodType: methodType,
            errorCallBack: errorCallBack,
            needTip: needTip);
        break;
      case RequestTypeEnum.CACHE_AND_NET:
        _requestCache<T>(url, param, successCallback,
            errorCallBack: errorCallBack);
        _executeRequest<T>(requestType, needCache, url, param, successCallback,
            methodType: methodType,
            errorCallBack: errorCallBack,
            needTip: needTip);
        break;
      case RequestTypeEnum.CACHE_OR_NET:
        _requestCache<T>(url, param, successCallback,
                errorCallBack: errorCallBack)
            .then((bool hasCache) {
          if (!hasCache) {
            _executeRequest<T>(
                requestType, needCache, url, param, successCallback,
                methodType: methodType,
                errorCallBack: errorCallBack,
                needTip: needTip);
          }
        });
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
  static Future<bool> _requestCache<T>(
      String url, BaseRequestEntity param, Function(BaseResponseEntity<T>) successCallback,
      {Function(MallException) errorCallBack}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String cacheKey = _createCacheKey(url, param);
    if (cacheKey == null) {
      return false;
    }
    String cacheData = sharedPreferences.getString(cacheKey);
    if (cacheData == null || cacheData.isEmpty) {
      return false;
    }
    Map<String, dynamic> cacheMap = jsonDecode(cacheData);

    /// 数据解析
    BaseResponseEntity<T> responseEntity =
        BaseResponseEntity.fromJson(cacheMap);
    successCallback(responseEntity);
    return true;
  }

  /// 创建缓存key
  /// @param url 请求地址
  /// @param param 参数
  /// @return String
  /// @author lizhid
  /// @modify
  /// @date 2019/5/28 11:43
  static String _createCacheKey(String url, BaseRequestEntity param) {
    if (url == null || url.isEmpty) {
      return null;
    }
    if (param == null) {
      return null;
    }
    return url + param.toJson().toString();
  }

  /// 请求
  /// @param requestType 请求类型
  /// @param needCache true:需要缓存，false：不需要缓存
  /// @param url 接口地址
  /// @param param 请求参数
  /// @param successCallback 请求成功回调
  /// @param methodType 请求类型
  /// @param errorCallBack 请求失败回调
  /// @param needTip true:需要提示，默认提示
  /// @return void
  /// @author lizhid
  /// @modify
  /// @date 2019/5/24 16:48
  static void _executeRequest<T>(RequestTypeEnum requestType, bool needCache,
      String url, BaseRequestEntity param, Function(BaseResponseEntity<T>) successCallback,
      {RequestMethodEnum methodType,
      Function(MallException) errorCallBack,
      bool needTip}) async {
    /// 请求方法选择
    methodType = methodType == null ? RequestMethodEnum.POST : methodType;

    /// 响应数据
    Response response;
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
      _handleResponse<T>(url, param, needCache, response, successCallback,
          needTip: needTip);
    } catch (e) {
      _handleException(e, errorCallBack, needTip);
    }
  }

  /// 处理响应数据
  /// @param url 请求地址
  /// @param param 请求参数
  /// @param needCache 是否需要缓存
  /// @param response 响应数据
  /// @param successCallback 请求成功回调
  /// @param errorCallBack 请求失败回调
  /// @param needTip true:需要提示，默认提示
  /// @return T
  /// @author lizhid
  /// @modify
  /// @date 2019/5/27 14:42
  static void _handleResponse<T>(String url, BaseRequestEntity param,
      bool needCache, Response response, Function(BaseResponseEntity<T>) successCallback,
      {Function(MallException) errorCallBack, bool needTip}) {
    if (response == null || response.data == null) {
      return;
    }
    if (response.statusCode != HttpStatus.ok) {
      return;
    }
    String responseBody = response.data;
    Map<String, dynamic> responseData = jsonDecode(responseBody);
    if (responseData == null) {
      return;
    }

    /// 判断服务器响应码
    BaseResponseEntity<T> responseEntity =
        BaseResponseEntity.fromJson(responseData);
    if (responseEntity != null) {
      responseEntity.requestUrl = url;
      if ("success" == responseEntity.msg) {
        if (needCache) {
          _saveCache(url, param, responseBody);
        }
        successCallback(responseEntity);
      } else {
        /// 请求失败
        if (needTip) {
          MallToast.showToast(responseEntity.msg);
        }
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
  static void _handleException(Exception e, Function(MallException) errorCallBack,bool needTip) {
    if (e == null) {
      return;
    }
    MallException mallException = new MallException();
    mallException.msg = "网络繁忙，请稍后重试！";
    if(e is DioError){
      DioError  dioError = e;
    }
    
    if(needTip){
      MallToast.showToast(mallException.msg);
    }
    errorCallBack(mallException);
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
      String url, BaseRequestEntity param, dynamic responseBody) async {
    if (responseBody == null) {
      return;
    }
    String cacheKey = _createCacheKey(url, param);
    if (cacheKey == null || cacheKey.isEmpty) {
      return;
    }

    String cacheData = responseBody.toString();
    if (cacheData == null || cacheData.isEmpty) {
      return;
    }
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(cacheKey, cacheData);
  }
}
