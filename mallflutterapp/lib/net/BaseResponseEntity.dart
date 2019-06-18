import 'dart:convert';

import '../entity_factory.dart';

/// 响应实体基础类
/// @author lizhid
/// @version V1.0.0
/// @date 2019/5/25
class BaseResponseEntity<T> {
  /// 响应码 200：成功
  int code;

  /// 数据内容
  T data;

  /// 响应提示
  String message;

  /// 请求地址
  String requestUrl;

  BaseResponseEntity({this.code, this.data, this.message, this.requestUrl});

  BaseResponseEntity.fromJson(Map<String, dynamic> json) {
    this.code = json['code'];
    this.message = json['message'];
    this.requestUrl = json['requestUrl'];
    try {
      this.data = EntityFactory.generateOBJ(json['data']);
    } catch (e,s) {
      print("数据解析异常-----"+e.toString() +"\n" + s.toString());
      this.data = jsonEncode(json['data']) as T;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    data['requestUrl'] = this.requestUrl;
    data['data'] = this.data;
    return data;
  }
}
