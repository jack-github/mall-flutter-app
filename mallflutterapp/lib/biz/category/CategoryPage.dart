import 'package:flutter/material.dart';
import 'package:annotation_route/route.dart';
import 'package:mallflutterapp/common/ViewConst.dart';

@ARoute(url: ViewConst.ROUTE_CATEGORY_CATEGORYPAGE)
class CategoryPage extends StatefulWidget {
  dynamic option;
  CategoryPage(this.option):super();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new CategoryPageState();
  }
}

class CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("Category Page"),
      ),
      body: Text("Hello CategoryPage"),
    );
  }
}
