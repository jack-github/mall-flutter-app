import 'dart:async';
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

  /// banner控件列表
  List<Widget> _bannerItemList = new List();

  /// 图片数量
  int _imageCount = 0;

  /// pageView滚动控制器
  PageController pageController = new PageController();

  /// 定时器
  Timer _timer;

  /// 当前位置
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: Column(
        children: <Widget>[
          _createTileBar(),
          _createPageView(),
          _createOperateMenu(),
          _crateLine(Colors.grey, 400),
          _createBroadcastWidget(),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    initBannerItem();
    restartTimer();
  }

  /// 开始倒计时
  /// @return void
  /// @author lizhid
  /// @modify
  /// @date 2019/6/13 20:16
  void restartTimer() {
    clearTimer();
    _timer =
        new Timer.periodic(new Duration(milliseconds: 2000), (Timer timer) {
      if (pageController.positions.isNotEmpty) {
        _index = pageController.page.round() + 1;
        pageController.animateToPage(_index,
            duration: new Duration(milliseconds: 400), curve: Curves.linear);
        setState(() {});
      }
    });
  }

  /// 清空计时器
  /// @return void
  /// @author lizhid
  /// @modify
  /// @date 2019/6/13 20:09
  void clearTimer() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
  }

  /// 初始化 banner条目
  /// @return void
  /// @author lizhid
  /// @modify
  /// @date 2019/6/13 19:40
  void initBannerItem() {
    if (_imageList == null) {
      return;
    }
    for (int i = 0; i < _imageList.length; i++) {
      _bannerItemList.add(_createPageViewItem(i));
    }
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

  /// 创建pageView
  /// @return Widget
  /// @author lizhid
  /// @modify
  /// @date 2019/5/30 13:44
  Widget _createPageView() {
    return Container(
        height: 200,
        child: Stack(children: <Widget>[
          PageView.builder(
              itemBuilder: (context, index) {
                return _bannerItemList[index % _bannerItemList.length];
              },
              controller: pageController,
              physics: const PageScrollPhysics(
                  parent: const ClampingScrollPhysics()),
              itemCount: 0x7fffffff,
              onPageChanged: (index) {
                _index = index;
              }),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  padding: EdgeInsets.only(bottom: 10), child: Text("占位")))
        ]));
  }

  /// 创建条目
  /// @param index
  /// @return Widget
  /// @author lizhid
  /// @modify
  /// @date 2019/5/30 11:53
  Widget _createPageViewItem(int index) {
    return GestureDetector(
      child: Image.network(
        _imageList[index],
        fit: BoxFit.cover,
      ),
      onTapDown: (TapDownDetails details) {},
      onTap: () {
        MallToast.showToast("点击了" + index.toString());
      },
      onTapUp: (TapUpDetails details) {},
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
      margin: EdgeInsets.only(top: 10, bottom: 10),
    );
  }

  /// 创建广播消息
  /// @return Widget
  /// @author lizhid
  /// @modify
  /// @date 2019/6/13 17:26
  Widget _createBroadcastWidget() {
    return Container(
        margin: EdgeInsets.only(top: 10),
        child: Stack(children: <Widget>[
          Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(left: 20),
                child: Image.asset("assets/images/icon_broadcast.png"),
              )),
          Center(child: Text("广播通知"))
        ]));
  }
}
