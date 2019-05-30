import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:annotation_route/route.dart';
import 'package:mallflutterapp/common/MallToast.dart';
import 'package:mallflutterapp/common/ViewConst.dart';
import 'package:mallflutterapp/net/ApiHost.dart';
import 'package:mallflutterapp/net/BaseResponseEntity.dart';
import 'package:mallflutterapp/net/MallException.dart';
import 'package:mallflutterapp/net/RequestManager.dart';
import 'package:mallflutterapp/net/RequestMethodEnum.dart';
import 'package:mallflutterapp/net/RequestTypeEnum.dart';

import 'MobileAddressRespEntity.dart';
import 'MobileAddressReqEntity.dart';
import 'package:mallflutterapp/biz/category/WeChatCategoryRespEntity.dart';

/// 首页
/// @author lizhid
/// @version V1.0.0
/// @date 2019/5/22
@ARoute(url: ViewConst.ROUTE_HOME_HOMEPAGE)
class HomePage extends StatefulWidget {
  dynamic option;

  HomePage(this.option) : super();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomePageState();
  }
}

/// 首页视图
/// @author lizhid
/// @version V1.0.0
/// @date 2019/5/22
class HomePageState extends State<HomePage> {
  /// 手机号码归属地
  MobileAddressRespEntity _testEntity = new MobileAddressRespEntity();

  /// 电话号码输入控制器
  TextEditingController _phoneController = new TextEditingController();

  /// 图片列表
  List<String> _imageList = [
    "http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20181113/movie_ad.jpg",
    "http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20181113/car_ad.jpg",
    "http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20181113/car_ad2.jpg"
  ];

  /// 图片数量
  int _imageCount = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: Column(
        children: <Widget>[
          _createPageView(),
          TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10), labelText: "请输入手机号码")),
          RaisedButton(
              child: new Text('请求数据'),
              onPressed: () {
                if (_phoneController.text == null ||
                    _phoneController.text.length < 11) {
                  MallToast.showToast("请输入正确的手机号码");
                  return;
                }

                MobileAddressReqEntity entity = new MobileAddressReqEntity();
                entity.phone = _phoneController.text;
                RequestManager.httpRequest<MobileAddressRespEntity>(
                    RequestTypeEnum.NET, true, ApiHost.phone_address_query,
                    param: entity,
                    methodType: RequestMethodEnum.GET, successCallback:
                        (BaseResponseEntity<MobileAddressRespEntity> data) {
                  if (data != null) {
                    setState(() {
                      _testEntity = data.result;
                    });
                    print(data.toJson().toString());
                  }
                }, errorCallBack: (MallException e) {
                  print(e);
                });
              }),
          RaisedButton(
            child: new Text("微信精选"),
            onPressed: () {},
          ),
          Text("号码：${_testEntity.mobileNumber}"),
          Text("运营商：${_testEntity.operator}"),
          Text("地址：${_testEntity.province}${_testEntity.city}"),
          Text("cityCode：${_testEntity.cityCode}"),
          Text("zipCode：${_testEntity.zipCode}")
        ],
      ),
    );
  }

  /// 创建pageView
  /// @return Widget
  /// @author lizhid
  /// @modify
  /// @date 2019/5/30 13:44
  Widget _createPageView() {
    return Container(
        height: 200,
        child: PageView.custom(
            childrenDelegate: SliverChildBuilderDelegate((context, index) {
          return _createPageViewItem(index);
        }, childCount: _imageList.length)));
  }

  /// 创建条目
  /// @param index
  /// @return Widget
  /// @author lizhid
  /// @modify
  /// @date 2019/5/30 11:53
  Widget _createPageViewItem(int index) {
    return Image.network(
      _imageList[index],
      fit: BoxFit.cover,
    );
  }
}
