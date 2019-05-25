
/// 响应实体基础类
/// @author lizhid
/// @version V1.0.0
/// @date 2019/5/25
class BaseResponseEntity {
  /// 状态信息 success：成功
  String status;
  /// 响应提示
  String msg;
  /// 响应码 0：成功
  int resCode;

  BaseResponseEntity({this.status, this.msg, this.resCode});

  BaseResponseEntity.fromJson(Map<String, dynamic> json) {    
    this.status = json['status'];
    this.msg = json['msg'];
    this.resCode = json['resCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    data['resCode'] = this.resCode;
    return data;
  }

}
