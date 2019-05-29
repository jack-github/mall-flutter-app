import 'package:mallflutterapp/net/BaseRequestEntity.dart';

class CategoryInfoListRequestEntity extends BaseRequestEntity {
  /// 类型编号
  String cid;
  /// 分页参数，起始页
  int page;
  /// 分页参数，每页记录数据
  int size;

  CategoryInfoListRequestEntity({this.cid,this.page,this.size});

  CategoryInfoListRequestEntity.fromJson(Map<String, dynamic> json) {
    this.cid = json['cid'];
    this.page = json['page'];
    this.size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    data['cid'] = this.cid;
    data['page'] = this.page;
    data['size'] = this.size;
    return data;
  }
}
