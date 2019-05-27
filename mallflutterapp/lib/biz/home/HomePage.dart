
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:annotation_route/route.dart';
import 'package:mallflutterapp/common/ViewConst.dart';
import 'package:mallflutterapp/net/ApiHost.dart';
import 'package:mallflutterapp/net/BaseResponseEntity.dart';
import 'package:mallflutterapp/net/MallException.dart';
import 'package:mallflutterapp/net/RequestManager.dart';
import 'package:mallflutterapp/net/RequestMethodEnum.dart';
import 'package:mallflutterapp/net/RequestTypeEnum.dart';

import 'TestEntity.dart';
import 'WeatherRequestEntity.dart';

/// 首页
/// @author lizhid
/// @version V1.0.0
/// @date 2019/5/22
@ARoute(url: ViewConst.ROUTE_HOME_HOMEPAGE)
class HomePage extends StatefulWidget {
  dynamic option;

  HomePage(this.option) : super();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomePageState();
  }
}

/// 首页视图
/// @author lizhid
/// @version V1.0.0
/// @date 2019/5/22
class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            new Text('Home Page'),
            RaisedButton(
                child: new Text('请求数据'),
                onPressed: () {
                  WeatherRequestEntity entity = new WeatherRequestEntity();
                  entity.phone = '18688821047';

                  RequestManager.httpRequest<TestEntity>(
                  RequestTypeEnum.CACHE_AND_NET, false, ApiHost.weather_query,(BaseResponseEntity<TestEntity> data){
                    if(data != null) {
                      print("----------------@@@" + data.result.city);
                    }else{
                      print("----------------" + data.toString());
                    }
                  },param: entity,methodType: RequestMethodEnum.GET,errorCallBack: (MallException e){
                    print(e);
                  });
                  print("----------------@@@@@@@@@@@@");
                }),

            RaisedButton(
              child: new Text("测试"),
              onPressed: () {
                test<BaseResponseEntity>().then((BaseResponseEntity onValue) {
                  print(onValue.toJson());
                });
              },
            )
          ],
        ),
      ),
    );
  }

  Future<T> test<T>() async {
//    Map<String, String> json = {
//      'key': '26864c7ba4dd5',
//      'city': '深圳',
//      'province': '广东'
//    };
//    WeatherRequestEntity w = WeatherRequestEntity.fromJson(json);
//     print(w.toJson());

        return testGet();
  }

   T testGet<T>(){
   T baseResponseEntity = new BaseResponseEntity(msg:"test") as T;
   return baseResponseEntity;
  }
}
