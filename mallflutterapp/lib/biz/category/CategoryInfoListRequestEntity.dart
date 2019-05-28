import 'package:mallflutterapp/net/BaseRequestEntity.dart';

class CategoryInfoListRequestEntity extends BaseRequestEntity {
  /// 类型编号
  String cid;

  CategoryInfoListRequestEntity({this.cid});

  CategoryInfoListRequestEntity.fromJson(Map<String, dynamic> json) {
    this.cid = json['cid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    data['cid'] = this.cid;
    return data;
  }
}
