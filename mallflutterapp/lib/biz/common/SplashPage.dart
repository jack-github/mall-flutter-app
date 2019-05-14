import 'package:flutter/material.dart';
import 'package:annotation_route/route.dart';
import 'package:mallflutterapp/common/ViewConst.dart';
import 'package:mallflutterapp/route/route.dart';

/// 启动页
/// @author lizhid
/// @version V1.0.0
/// @date 2019/5/14
@ARoute(url: ViewConst.ROUTE_COMMON_SPLASHPAGE)
class SplashPage extends StatefulWidget{
  dynamic option;
  SplashPage(this.option):super();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new SplashPageState();
  }
}


/// 启动页State
/// @author lizhid
/// @version V1.0.0
/// @date 2019/5/14
class SplashPageState extends State<SplashPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: Center(
        child: Text("Hello 这是启动页"),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    countDown();
  }

    /// 延迟跳转
    /// @return
    /// @author lizhid
    /// @modify
    /// @date 2019/5/14 15:51
  void countDown(){
    var duration = new Duration(seconds: 3);
    Future.delayed(duration,(){
      startAppRootPage();
    });
  }

    /// 启动首页
    /// @return
    /// @author lizhid
    /// @modify
    /// @date 2019/5/14 15:51
  void startAppRootPage(){
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
      return MallRoute.getPage(ViewConst.ROUTE_COMMON_APPROOTPAGE, {});
    }));
  }
}