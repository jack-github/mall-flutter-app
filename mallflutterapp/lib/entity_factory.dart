import 'package:mallflutterapp/biz/home/a_a_entity.dart';
import 'package:mallflutterapp/biz/home/test2_entity.dart';
import 'package:mallflutterapp/biz/home/TestEntity.dart';
import 'package:mallflutterapp/biz/home/WeatherRequestEntity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "AAEntity") {
      return AAEntity.fromJson(json) as T;
    } else if (T.toString() == "Test2Entity") {
      return Test2Entity.fromJson(json) as T;
    } else if (T.toString() == "TestEntity") {
      return TestEntity.fromJson(json) as T;
    } else if (T.toString() == "WeatherRequestEntity") {
      return WeatherRequestEntity.fromJson(json) as T;
    } else {
      return json;
    }
  }
}