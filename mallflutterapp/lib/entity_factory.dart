import 'package:mallflutterapp/biz/category/CategoryInfoListRequestEntity.dart';
import 'package:mallflutterapp/biz/category/CategoryInfoListRespEntity.dart';
import 'package:mallflutterapp/biz/category/WeChatCategoryRespEntity.dart';
import 'package:mallflutterapp/biz/home/MobileAddressReqEntity.dart';
import 'package:mallflutterapp/biz/home/MobileAddressRespEntity.dart';
import 'package:mallflutterapp/data/home/model/ContentRespEntity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "CategoryInfoListRequestEntity") {
      return CategoryInfoListRequestEntity.fromJson(json) as T;
    } else if (T.toString() == "CategoryInfoListRespEntity") {
      return CategoryInfoListRespEntity.fromJson(json) as T;
    } else if (T.toString() == "WeChatCategoryRespEntity") {
      return WeChatCategoryRespEntity.fromJson(json) as T;
    } else if (T.toString() == "MobileAddressReqEntity") {
      return MobileAddressReqEntity.fromJson(json) as T;
    } else if (T.toString() == "MobileAddressRespEntity") {
      return MobileAddressRespEntity.fromJson(json) as T;
    } else if (T.toString() == "ContentRespEntity") {
      return ContentRespEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}