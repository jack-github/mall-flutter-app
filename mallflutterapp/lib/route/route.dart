import 'package:annotation_route/route.dart';
import './route.internal.dart';
import 'package:flutter/material.dart';

@ARouteRoot()
class MallRouteOption {
  ///页面地址
  String url;

  ///数据传递
  Map<String, dynamic> bundle;

  MallRouteOption(this.url, this.bundle);
}

class MallRoute {
  static Widget getPage(String url, Map<String, dynamic> bundle) {
    ARouterInternalImpl internal = ARouterInternalImpl();
    ARouterResult routerResult = internal.findPage(
        ARouteOption(url, bundle), MallRouteOption(url, bundle));
    if (routerResult.state == ARouterResultState.FOUND) {
      return routerResult.widget;
    }
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("NOT FOUND"),
      ),
    );
  }
}
