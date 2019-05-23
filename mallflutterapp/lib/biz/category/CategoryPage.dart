import 'package:flutter/material.dart';
import 'package:annotation_route/route.dart';
import 'package:mallflutterapp/common/ViewConst.dart';


/// 分类界面
/// @author lizhid
/// @version V1.0.0
/// @date 2019/5/22
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


/// 分类视图
/// @author lizhid
/// @version V1.0.0
/// @date 2019/5/22
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
