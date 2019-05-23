import 'package:flutter/material.dart';
import 'package:annotation_route/route.dart';
import 'package:mallflutterapp/common/ViewConst.dart';

/// 账户
/// @author lizhid
/// @version V1.0.0
/// @date 2019/5/22
@ARoute(url: ViewConst.ROUTE_ACCOUNT_ACCOUNTPAGE)
class AccountPage extends StatefulWidget {
  dynamic option;
  AccountPage(this.option):super();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new AccountPageState();
  }
}

/// 账户视图
/// @author lizhid
/// @version V1.0.0
/// @date 2019/5/22
class AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("Account Page"),
      ),
      body: Text("Hello AccountPage"),
    );
  }
}