import 'package:flutter/material.dart';
import 'package:annotation_route/route.dart';
import 'package:mallflutterapp/common/ViewConst.dart';

/// 专题
/// @author lizhid
/// @version V1.0.0
/// @date 2019/5/22
@ARoute(url: ViewConst.ROUTE_SPECIAL_SPECIALPAGE)
class SpecialPage extends StatefulWidget {
  dynamic option;
  SpecialPage(this.option):super();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new SpecialPagePageState();
  }
}

/// 专题视图
/// @author lizhid
/// @version V1.0.0
/// @date 2019/5/22
class SpecialPagePageState extends State<SpecialPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("Special Page"),
      ),
      body: Text("Hello SpecialPage"),
    );
  }
}
