import 'package:flutter/material.dart';
import 'package:annotation_route/route.dart';
import 'package:mallflutterapp/common/ViewConst.dart';
import 'package:mallflutterapp/route/route.dart';
import 'package:transparent_image/transparent_image.dart';

/// 启动页
/// @author lizhid
/// @version V1.0.0
/// @date 2019/5/14
@ARoute(url: ViewConst.ROUTE_COMMON_SPLASHPAGE)
class SplashPage extends StatefulWidget {
  dynamic option;

  SplashPage(this.option) : super();

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
class SplashPageState extends State<SplashPage> {
  bool stopCountDown = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Stack(
      alignment: Alignment.center,
      children: <Widget>[
        new Container(
          color: Colors.transparent,
          child: Image.network(
              "http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg",
              fit: BoxFit.fill),
          constraints: new BoxConstraints.expand()),
        new Container(
            color: Colors.transparent,
            child: Image.asset(
                "assets/images/im_splash.jpg",
                fit: BoxFit.fill),
            constraints: new BoxConstraints.expand()),
        new Container(
            margin: EdgeInsets.fromLTRB(0, 30, 10, 0),
            child: new Align(
              alignment: Alignment.topRight,
              child: FlatButton(
                color: Color(0x0a000000),
                splashColor: Colors.lightBlueAccent[50],
                onPressed: startAppRootPage,
                child: Text(
                  "跳过",
                  style: new TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ))
      ],
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
  void countDown() {
    var duration = new Duration(seconds: 1);
    Future.delayed(duration, () {
      if (!stopCountDown) {
        startAppRootPage();
      }
    });
  }

  /// 启动首页
  /// @return
  /// @author lizhid
  /// @modify
  /// @date 2019/5/14 15:51
  void startAppRootPage() {
    this.stopCountDown = true;
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) {
      return MallRoute.getPage(ViewConst.ROUTE_COMMON_APPROOTPAGE, {});
    }), (route) => route == null);
  }
}
