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

  AccountPage(this.option) : super();

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
        body: Container(
            child: Expanded(
                child: FadeInImage.assetNetwork(
                    placeholder: "assets/images/im_splash.jpg",
                    image:
                        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1559212291995&di=b7b460d7ffa346001d41775c34a630b1&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01ca115542fa200000019ae98211f7.jpg",
                    fit: BoxFit.fill))));
  }
}
