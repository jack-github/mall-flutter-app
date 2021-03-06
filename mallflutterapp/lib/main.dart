import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mallflutterapp/route/route.dart';
import 'package:mallflutterapp/common/ViewConst.dart';
import 'package:mallflutterapp/util/DimenUtil.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    init();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MallRoute.getPage(ViewConst.ROUTE_COMMON_SPLASHPAGE, {}),
    );
  }
}

/// 初始化
/// @return void
/// @author lizhid
/// @modify
/// @date 2019/6/24 17:01
void init() {
  DimenUtil.initDimenUtil(360, 640, window.physicalSize,window.devicePixelRatio);
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return MallRoute.getPage('page//test', {});
                }));
              },
              child: const Text("测试"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.account_circle),
      ),
    );
  }
}
