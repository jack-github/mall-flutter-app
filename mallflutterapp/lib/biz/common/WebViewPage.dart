import 'package:flutter/material.dart';
import 'package:annotation_route/route.dart';
import 'package:mallflutterapp/common/ViewConst.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

/// 浏览器页面
/// @author lizhid
/// @version V1.0.0
/// @date 2019/5/29
@ARoute(url: ViewConst.ROUTE_COMMON_WEBVIEWPAGE)
class WebViewPage extends StatefulWidget {
  dynamic option;

  WebViewPage(this.option) : super();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WebViewPageState(option);
  }
}

/// 浏览器页面State
/// @author lizhid
/// @version V1.0.0
/// @date 2019/5/29
class WebViewPageState extends State<WebViewPage> {
  dynamic option;

  WebViewPageState(this.option) : super();

  /// 地址
  String _url;

  /// 标题
  String _title;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WebviewScaffold(url: _url, appBar: AppBar(title: Text(_title)));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (option != null) {
      _url = option.bundle['url'];
      _title = option.bundle['title'];
    }
  }
}
