import 'package:mallflutterapp/biz/home/MobileAddressReqEntity.dart';
import 'package:mallflutterapp/biz/home/MobileAddressRespEntity.dart';
import 'package:mallflutterapp/biz/home/WeChatCategoryRespEntity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "MobileAddressReqEntity") {
      return MobileAddressReqEntity.fromJson(json) as T;
    } else if (T.toString() == "MobileAddressRespEntity") {
      return MobileAddressRespEntity.fromJson(json) as T;
    } else if (T.toString() == "WeChatCategoryRespEntity") {
      return WeChatCategoryRespEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}