import 'package:flutter/material.dart';
import 'package:annotation_route/route.dart';
import 'package:mallflutterapp/biz/account/AccountPage.dart';
import 'package:mallflutterapp/biz/category/CategoryPage.dart';
import 'package:mallflutterapp/biz/home/HomePage.dart';
import 'package:mallflutterapp/biz/special/SpecialPage.dart';
import 'package:mallflutterapp/common/ViewConst.dart';

/// APP主界面
/// @author lizhid
/// @version V1.0.0
/// @date 2019/5/14
@ARoute(url: ViewConst.ROUTE_COMMON_APPROOTPAGE)
class AppRootPage extends StatefulWidget {
  dynamic option;

  AppRootPage(this.option) : super();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new AppRootPageState();
  }
}

class AppRootPageState extends State<AppRootPage>
    with SingleTickerProviderStateMixin {
  /// 选中位置
  int _selectedIndex = 0;

  /// 文字样式
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  /// tab名称
  List<Widget> _widgetOption = <Widget>[
    HomePage({}),
    CategoryPage({}),
    SpecialPage({}),
    AccountPage({})
  ];

  /// 菜单名称
  var tabText = ['首页', '分类', '专题', '我的'];

  /// 获取菜单文案
  /// @param index
  /// @return Text
  /// @author lizhid
  /// @modify
  /// @date 2019/5/22 10:56
  Text getTextTabTitle(int index) {
    if (_selectedIndex != index) {
      return new Text(tabText[index],
          style: TextStyle(fontSize: 13, color: Color(0xff424242)));
    } else {
      return new Text(tabText[index],
          style: TextStyle(fontSize: 13, color: Colors.lightBlueAccent));
    }
  }

  /// 修改选中标记
  /// @param index 选中位置
  /// @return void
  /// @author lizhid
  /// @modify
  /// @date 2019/5/22 10:02
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: Center(child: _widgetOption.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: getTextTabTitle(0)),
            BottomNavigationBarItem(
                icon: Icon(Icons.style), title: getTextTabTitle(1)),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_balance_wallet),
                title: getTextTabTitle(2)),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box), title: getTextTabTitle(3))
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
