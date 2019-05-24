import 'MallExceptionTypeEnum.dart';

/// 商城异常类
/// @author lizhid
/// @version V1.0.0
/// @date 2019/5/24
class MallException implements Exception {
  /// 错误信息
  String msg;

  /// 错误码
  int code;

  /// 错误类型
  MallExceptionTypeEnum type;

  MallException(MallExceptionTypeEnum type, int code, String msg) {
    this.type = type;
    this.code = code;
    this.msg = msg;
  }
}
