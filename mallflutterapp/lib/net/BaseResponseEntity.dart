import '../entity_factory.dart';

/// 响应实体基础类
/// @author lizhid
/// @version V1.0.0
/// @date 2019/5/25
class BaseResponseEntity<T> {
  /// 状态信息 success：成功
  String status;

  /// 响应提示
  String msg;

  /// 响应码 0：成功
  int resCode;

  /// 数据内容
  T result;

  /// 请求地址
  String requestUrl;

  BaseResponseEntity({this.status, this.msg, this.resCode,this.result,this.requestUrl});

  BaseResponseEntity.fromJson(Map<String, dynamic> json) {
    this.status = json['status'];
    this.msg = json['msg'];
    this.resCode = json['resCode'];
    this.requestUrl = json['requestUrl'];
    try {
      this.result = EntityFactory.generateOBJ(json['result']);
    } catch (e) {
      this.result = json['result'];
      print(e);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    data['resCode'] = this.resCode;
    data['requestUrl'] = this.requestUrl;
    data['result'] = this.result;
    return data;
  }
}
