import 'package:flutter/material.dart';
import 'package:annotation_route/route.dart';
import 'package:mallflutterapp/common/ViewConst.dart';

/// APP主界面
/// @author lizhid
/// @version V1.0.0
/// @date 2019/5/14
@ARoute(url: ViewConst.ROUTE_COMMON_APPROOTPAGE)
class AppRootPage extends StatelessWidget{
  dynamic option;
  AppRootPage(this.option):super();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: Text("Hello 这是主页面"),
    );
  }

}