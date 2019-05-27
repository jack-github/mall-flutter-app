import 'package:mallflutterapp/net/BaseRequestEntity.dart';

class WeatherRequestEntity extends BaseRequestEntity{
  String  phone;

  WeatherRequestEntity({this.phone});


  WeatherRequestEntity.fromJson(Map<String, dynamic> json) {
    this.phone = json['phone'];
  }


  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = super.toJson();
    data['phone'] = this.phone;
    return data;
  }

}
