import 'MallException.dart';

/// 请求回调
/// @author lizhid
/// @version V1.0.0
/// @date 2019/5/24
class RequestCallBack<T> {
  /// 请求成功
  /// @param response 响应数据
  /// @param url 接口地址
  /// @return void
  /// @author lizhid
  /// @modify
  /// @date 2019/5/24 14:39
  void onSuccess(T response, String url){}

  /// 请求失败
  /// @param e 异常
  /// @param url 接口地址
  /// @return void
  /// @author lizhid
  /// @modify
  /// @date 2019/5/24 14:40
  void onError(MallException e, String url){}
}
