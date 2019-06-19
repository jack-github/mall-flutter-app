import 'package:annotation_route/route.dart';
import 'package:flutter/material.dart';
import 'package:mallflutterapp/common/MallToast.dart';
import 'package:mallflutterapp/common/ViewConst.dart';
import 'package:mallflutterapp/common/widget/BannerView.dart';
import 'package:mallflutterapp/common/widget/WidgetUtil.dart';
import 'package:mallflutterapp/data/home/HomeRequest.dart';
import 'package:mallflutterapp/data/home/model/ContentRespEntity.dart';
import 'package:mallflutterapp/net/BaseResponseEntity.dart';
import 'package:mallflutterapp/net/MallException.dart';
import 'package:mallflutterapp/route/route.dart';

import 'HomeProductPanel.dart';

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
  /// 主结构控件列表
  List<Widget> _baseWidgetList = new List();

  /// 首页数据
  ContentRespEntity _contentRespEntity;

  /// banner控件
  BannerView _bannerView;

  /// 推荐商品
  HomeProductPanel _homeProductPanel;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
          child: Container(
              child: Column(
        children: _baseWidgetList,
      ))),
    );
  }

  /// 创建基础视图
  /// @return void
  /// @author lizhid
  /// @modify
  /// @date 2019/6/18 20:57
  void createView() {
    _baseWidgetList.add(_createTileBar());
    _baseWidgetList.add(_createBannerView());
    _baseWidgetList.add(_createOperateMenu());
    _baseWidgetList.add(WidgetUtil.createLine(Color(0xFFBDBDBD), 1));
    _baseWidgetList.add(_createBroadcastWidget());
    _baseWidgetList.add(WidgetUtil.createLine(Color(0xFFBDBDBD), 1));
    _baseWidgetList.add(_createBrandPanel());
  }

  /// 创建banner视图
  /// @param
  /// @return Widget
  /// @author lizhid
  /// @modify
  /// @date 2019/6/17 14:22
  Widget _createBannerView() {
    _bannerView = BannerView(null,
        onBannerItemClick: (int position, BannerItemBean bannerItemBean) {
      if (bannerItemBean == null) {
        return;
      }
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        Map<String, dynamic> bundle = new Map();
        bundle['url'] = bannerItemBean.url;
        bundle['title'] = bannerItemBean.title;
        return MallRoute.getPage(ViewConst.ROUTE_COMMON_WEBVIEWPAGE, bundle);
      }));
    });
    return _bannerView;
  }

  @override
  void initState() {
    print("--------initState");
    super.initState();
    createView();
    requestHomeContent();
  }

  @override
  void didUpdateWidget(HomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("--------oldWidget");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("--------reassemble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("--------didChangeDependencies");
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
  void requestHomeContent() {
    HomeRequest.requestContent((BaseResponseEntity<ContentRespEntity> result) {
      if (result == null) {
        return;
      }
      if (result.data == null) {
        return;
      }
      _contentRespEntity = result.data;
      List<BannerItemBean> bannerDataList = createBannerDataList();
      if (_bannerView != null) {
        _bannerView.updateBannerData(bannerDataList);
      }
      if(_homeProductPanel != null){
        _homeProductPanel.updateItemList(_createBrandPanelItemList());
      }
    }, (MallException e) {});
  }

  /// 创建banner数据列表
  /// @return List<BannerItemBean>
  /// @author lizhid
  /// @modify
  /// @date 2019/6/18 15:47
  List<BannerItemBean> createBannerDataList() {
    if (_contentRespEntity == null) {
      return null;
    }
    if (_contentRespEntity.advertiseList == null ||
        _contentRespEntity.advertiseList.length == 0) {
      return null;
    }
    List<BannerItemBean> dataList = new List();
    _contentRespEntity.advertiseList
        .forEach((ContentRespDataAdvertiselist data) {
      BannerItemBean bannerItemBean =
          new BannerItemBean(data.pic, data.url, data.name);
      dataList.add(bannerItemBean);
    });
    return dataList;
  }

  /// 创建推荐商品面板
  /// @return Widget
  /// @author lizhid
  /// @modify
  /// @date 2019/6/19 15:37
  Widget _createBrandPanel() {
    _homeProductPanel = HomeProductPanel(
        Container(
          padding: EdgeInsets.only(top: 10,left: 10,right: 10),
            child: Stack(
          children: <Widget>[
            Text("品牌制造商直供"),
            Align(
                alignment: Alignment.centerRight,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text("更多推荐"),
                      Icon(Icons.arrow_forward)
                    ]))
          ],
        )),
        null,
        SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 10,
            childAspectRatio: 1));
    return Container(margin: EdgeInsets.only(top: 20), child: _homeProductPanel);
  }

  /// 创建控件列表
  /// @return List<Widget>
  /// @author lizhid
  /// @modify
  /// @date 2019/6/19 16:18
  List<Widget> _createBrandPanelItemList() {
    if (_contentRespEntity == null) {
      return null;
    }
    if (_contentRespEntity.brandList == null ||
        _contentRespEntity.brandList.length == 0) {
      return null;
    }
    List<Widget> itemList = new List();
    _contentRespEntity.brandList.forEach((ContentRespDataBrandlist data) {
      itemList.add(_createBrandPanelItem(data));
    });
    return itemList;
  }

  /// 创建推荐商品条目
  /// @param data 数据源
  /// @return Widget
  /// @author lizhid
  /// @modify
  /// @date 2019/6/19 16:20
  Widget _createBrandPanelItem(ContentRespDataBrandlist data) {
    return Container(
      child: Text("aaaa"),
    );
  }
}
