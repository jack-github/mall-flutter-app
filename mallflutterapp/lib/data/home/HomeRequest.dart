import 'package:mallflutterapp/net/ApiHost.dart';
import 'package:mallflutterapp/net/BaseResponseEntity.dart';
import 'package:mallflutterapp/net/MallException.dart';
import 'package:mallflutterapp/net/RequestManager.dart';
import 'package:mallflutterapp/net/RequestMethodEnum.dart';
import 'package:mallflutterapp/net/RequestTypeEnum.dart';

import 'model/ContentRespEntity.dart';

/// 首页数据请求类
/// @author lizhid
/// @version V1.0.0
/// @date 2019/6/17
class HomeRequest {
  /// 请求首页数据
  /// @param successCallback
  /// @param errorCallBack
  /// @return void
  /// @author lizhid
  /// @modify
  /// @date 2019/6/17 19:14
  static void requestContent(
      Function(BaseResponseEntity<ContentRespEntity>) successCallback,
      Function(MallException) errorCallBack) {
    RequestManager.httpRequest(
        RequestTypeEnum.CACHE_AND_NET, true, ApiHost.HOME_CONTENT,
        successCallback: successCallback, errorCallBack: errorCallBack,methodType: RequestMethodEnum.GET);
  }
}
