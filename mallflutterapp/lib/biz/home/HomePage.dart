import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:annotation_route/route.dart';
import 'package:mallflutterapp/common/MallToast.dart';
import 'package:mallflutterapp/common/ViewConst.dart';
import 'package:mallflutterapp/common/widget/BannerView.dart';
import 'package:mallflutterapp/data/home/HomeRequest.dart';
import 'package:mallflutterapp/data/home/model/ContentRespEntity.dart';
import 'package:mallflutterapp/net/ApiHost.dart';
import 'package:mallflutterapp/net/BaseResponseEntity.dart';
import 'package:mallflutterapp/net/BaseResponseEntity2.dart';
import 'package:mallflutterapp/net/MallException.dart';
import 'package:mallflutterapp/net/RequestManager2.dart';
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

  /// 图片列表
  List<String> _imageList = [
    "http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20181113/movie_ad.jpg",
    "http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20181113/car_ad.jpg",
    "http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20181113/car_ad2.jpg"
  ];

  /// 首页数据
  ContentRespEntity _contentRespEntity = null;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: SingleChildScrollView(child: Container(
          color: Colors.grey[200],
          child: Column(
            children: <Widget>[
              _createTileBar(),
              _createBannerView(),
              _createOperateMenu(),
              _crateLine(Colors.grey, 400),
              _createBroadcastWidget(),
              _crateLine(Colors.grey, 400),
            ],
          ))),
    );
  }

  /// 创建banner视图
  /// @param
  /// @return Widget
  /// @author lizhid
  /// @modify
  /// @date 2019/6/17 14:22
  Widget _createBannerView() {
    List<BannerItemBean> dataList = new List();
    _imageList.forEach((String imagePath) {
      BannerItemBean bannerItemBean = new BannerItemBean(imagePath);
      dataList.add(bannerItemBean);
    });
    return BannerView(dataList,
        onBannerItemClick: (int position, BannerItemBean bannerItemBean) {
      MallToast.showToast("点击了" + position.toString());
    });
  }

  @override
  void initState() {
    super.initState();
    requestHomeContent();
  }

  /// 划线
  /// @param color 颜色
  /// @param colorValue 颜色值
  /// @return Widget
  /// @author lizhid
  /// @modify
  /// @date 2019/6/13 17:32
  Widget _crateLine(MaterialColor color, int colorValue) {
    return Container(color: color[colorValue], height: 1);
  }

  /// 创建顶部状态栏
  /// @return Widget
  /// @author lizhid
  /// @modify
  /// @date 2019/6/13 15:23
  Widget _createTileBar() {
    return Container(
      color: Colors.white,
      height: 70,
      padding: EdgeInsets.only(top: 20),
      child: Stack(
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(left: 10),
              child: GestureDetector(
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Stack(children: <Widget>[
                        Image.asset(
                          "assets/images/icon_msg.png",
                          width: 20,
                          height: 20,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 12),
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                        )
                      ])),
                  onTap: () {
                    MallToast.showToast("点击了消息");
                  })),
          Center(
            child:
                Text("首页", style: TextStyle(color: Colors.black, fontSize: 20)),
          ),
          Align(
              alignment: Alignment.centerRight,
              child: Container(
                  padding: EdgeInsets.only(right: 10),
                  width: 60,
                  child: Row(
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.only(right: 10),
                          child: GestureDetector(
                              child: Image.asset(
                                "assets/images/icon_search.png",
                                width: 20,
                                height: 20,
                              ),
                              onTap: () {
                                MallToast.showToast("点击了搜索");
                              })),
                      GestureDetector(
                          child: Stack(
                            children: <Widget>[
                              Image.asset(
                                "assets/images/icon_car.png",
                                width: 20,
                                height: 20,
                              )
                            ],
                          ),
                          onTap: () {
                            MallToast.showToast("点击了购物车");
                          })
                    ],
                  )))
        ],
      ),
    );
  }

  /// 操作菜单
  /// @return Widget
  /// @author lizhid
  /// @modify
  /// @date 2019/6/13 17:25
  Widget _createOperateMenu() {
    double itemWidth = 90;
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Container(
              width: itemWidth,
              child: GestureDetector(
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/icon_ht.png",
                      width: 25,
                      height: 25,
                    ),
                    Text("话题")
                  ],
                ),
                onTap: () {
                  MallToast.showToast("话题");
                },
              )),
          Container(
              width: itemWidth,
              child: GestureDetector(
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/icon_youxuan.png",
                      width: 25,
                      height: 25,
                    ),
                    Text("优选")
                  ],
                ),
                onTap: () {
                  MallToast.showToast("优选");
                },
              )),
          Container(
              width: itemWidth,
              child: GestureDetector(
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/icon_tehui.png",
                      width: 25,
                      height: 25,
                    ),
                    Text("特惠")
                  ],
                ),
                onTap: () {
                  MallToast.showToast("特惠");
                },
              )),
          Container(
              width: itemWidth,
              child: GestureDetector(
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/icon_sign.png",
                      width: 25,
                      height: 25,
                    ),
                    Text("签到")
                  ],
                ),
                onTap: () {
                  MallToast.showToast("签到");
                },
              ))
        ],
      ),
    );
  }

  /// 创建广播消息
  /// @return Widget
  /// @author lizhid
  /// @modify
  /// @date 2019/6/13 17:26
  Widget _createBroadcastWidget() {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: Stack(children: <Widget>[
          Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(left: 20),
                child: Image.asset("assets/images/icon_broadcast.png"),
              )),
          Center(child: Text("广播通知")),
          Container(
              margin: EdgeInsets.only(right: 20),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                      height: 25,
                      child: GestureDetector(
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 5, right: 5, top: 3, bottom: 3),
                          child: Text('详情',
                              style:
                                  TextStyle(color: Colors.green, fontSize: 13)),
                        ),
                        onTap: () {
                          MallToast.showToast("查看详情");
                        },
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green),
                          borderRadius: BorderRadius.all(Radius.circular(5))))))
        ]));
  }


    /// 请求首页数据
    /// @return void
    /// @author lizhid
    /// @modify
    /// @date 2019/6/17 19:26
  void requestHomeContent(){
    HomeRequest.requestContent((BaseResponseEntity<ContentRespData> data){

    }, (MallException e){

    });
  }

}
