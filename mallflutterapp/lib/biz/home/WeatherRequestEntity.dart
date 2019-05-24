import 'package:mallflutterapp/net/BaseRequestEntity.dart';

/// 天气属性类
/// @author lizhid
/// @version V1.0.0
/// @date 2019/5/23
class WeatherRequestEntity extends BaseRequestEntity {
  /// 城市
  String city;

  /// 省份
  String province;

  String key = '26864c7ba4dd5';

  Map<String, dynamic> toJson() {
    return {"city": this.city, "province": this.province, "key": this.key};
  }

}
