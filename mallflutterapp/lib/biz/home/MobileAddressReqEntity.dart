import 'package:mallflutterapp/net/BaseRequestEntity.dart';

/// 手机归属地查询
/// @author lizhid
/// @version V1.0.0
/// @date 2019/5/28
class MobileAddressReqEntity extends BaseRequestEntity{
  /// 手机号码
  String  phone;

  MobileAddressReqEntity({this.phone});


  MobileAddressReqEntity.fromJson(Map<String, dynamic> json) {
    this.phone = json['phone'];
  }


  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = super.toJson();
    data['phone'] = this.phone;
    return data;
  }

}
