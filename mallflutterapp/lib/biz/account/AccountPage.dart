import 'package:flutter/material.dart';
import 'package:annotation_route/route.dart';
import 'package:mallflutterapp/common/ViewConst.dart';

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