import 'package:flutter/material.dart';
import 'package:annotation_route/route.dart';
import 'package:mallflutterapp/common/ViewConst.dart';

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
