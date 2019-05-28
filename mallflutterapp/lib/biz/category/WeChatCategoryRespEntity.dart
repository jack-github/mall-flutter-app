import 'package:mallflutterapp/net/BaseResponseEntity.dart';

/// 微信精选响应实体
/// @author lizhid
/// @version V1.0.0
/// @date 2019/5/28
class WeChatCategoryRespEntity extends BaseResponseEntity {
  /// 分类列表
  List<WeChatCategoryRespEntityResult> list;

  WeChatCategoryRespEntity({this.list});

  WeChatCategoryRespEntity.fromJson(dynamic json) {
    if (json != null) {
      list = new List<WeChatCategoryRespEntityResult>();
      (json as List).forEach((v) {
        list.add(new WeChatCategoryRespEntityResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    if (this.list != null) {
      data['result'] = this.list.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

/// 微信精选响应实体内容
/// @author lizhid
/// @version V1.0.0
/// @date 2019/5/28
class WeChatCategoryRespEntityResult {
  /// 名称
  String name;

  /// 编号
  String cid;

  WeChatCategoryRespEntityResult({this.name = '', this.cid = ''});

  WeChatCategoryRespEntityResult.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    cid = json['cid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['cid'] = this.cid;
    return data;
  }
}
