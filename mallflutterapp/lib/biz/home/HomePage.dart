import 'package:flutter/material.dart';
import 'package:annotation_route/route.dart';
import 'package:mallflutterapp/common/ViewConst.dart';

@ARoute(url: ViewConst.ROUTE_HOME_HOMEPAGE)
class HomePage extends StatefulWidget {
  dynamic option;
  HomePage(this.option):super();
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Text("Hello HomePage"),
    );
  }
}
