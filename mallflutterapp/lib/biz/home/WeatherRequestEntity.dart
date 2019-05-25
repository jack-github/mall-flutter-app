import 'package:mallflutterapp/net/BaseRequestEntity.dart';

class WeatherRequestEntity extends BaseRequestEntity{
  String city;
  String province;

  WeatherRequestEntity({this.city, this.province});


  WeatherRequestEntity.fromJson(Map<String, dynamic> json) {
    this.city = json['city'];
    this.province = json['province'];
  }


  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = super.toJson();
    data['city'] = this.city;
    data['province'] = this.province;
    return data;
  }

}
