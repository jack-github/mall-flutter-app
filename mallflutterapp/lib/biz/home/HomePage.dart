import 'package:annotation_route/route.dart';
import 'package:flutter/material.dart';
import 'package:mallflutterapp/common/MallToast.dart';
import 'package:mallflutterapp/common/ViewConst.dart';
import 'package:mallflutterapp/common/widget/BannerView.dart';
import 'package:mallflutterapp/common/widget/ResourceUtil.dart';
import 'package:mallflutterapp/common/widget/WidgetUtil.dart';
import 'package:mallflutterapp/data/home/HomeRequest.dart';
import 'package:mallflutterapp/data/home/model/ContentRespEntity.dart';
import 'package:mallflutterapp/net/BaseResponseEntity.dart';
import 'package:mallflutterapp/net/MallException.dart';
import 'package:mallflutterapp/route/route.dart';
import 'package:mallflutterapp/util/DimenUtil.dart';
import 'package:transparent_image/transparent_image.dart';

import 'HomeProductPanel.dart';

/// 首页
/// @author lizhid
/// @version V1.0.0
/// @date 2019/5/22
@ARoute(url: ViewConst.ROUTE_HOME_HOMEPAGE)
// ignore: must_be_immutable
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
      backgroundColor: Colors.grey[100],
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
    _baseWidgetList
        .add(WidgetUtil.createLine(Color(0xFFEEEEEE), DimenUtil.getDimen(1)));
    _baseWidgetList.add(_createBroadcastWidget());
    _baseWidgetList
        .add(WidgetUtil.createLine(Color(0xFFEEEEEE), DimenUtil.getDimen(1)));
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
      height: DimenUtil.getDimen(70),
      padding: EdgeInsets.only(top: DimenUtil.getDimen(20)),
      child: Stack(
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(left: DimenUtil.getDimen(10)),
              child: GestureDetector(
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Stack(children: <Widget>[
                        Image.asset(
                          "assets/images/icon_msg.png",
                          width: DimenUtil.getDimen(20),
                          height: DimenUtil.getDimen(20),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: DimenUtil.getDimen(12)),
                          width: DimenUtil.getDimen(10),
                          height: DimenUtil.getDimen(10),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                        )
                      ])),
                  onTap: () {
                    MallToast.showToast("点击了消息");
                  })),
          Center(
            child: Text("首页",
                style: TextStyle(
                    color: Colors.black, fontSize: DimenUtil.getDimen(20))),
          ),
          Align(
              alignment: Alignment.centerRight,
              child: Container(
                  padding: EdgeInsets.only(right: DimenUtil.getDimen(10)),
                  width: DimenUtil.getDimen(60),
                  child: Row(
                    children: <Widget>[
                      Container(
                          padding:
                              EdgeInsets.only(right: DimenUtil.getDimen(10)),
                          child: GestureDetector(
                              child: Image.asset(
                                "assets/images/icon_search.png",
                                width: DimenUtil.getDimen(20),
                                height: DimenUtil.getDimen(20),
                              ),
                              onTap: () {
                                MallToast.showToast("点击了搜索");
                              })),
                      GestureDetector(
                          child: Stack(
                            children: <Widget>[
                              Image.asset(
                                "assets/images/icon_car.png",
                                width: DimenUtil.getDimen(20),
                                height: DimenUtil.getDimen(20),
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
    double itemWidth = DimenUtil.getDimen(90);
    double itemHeight = DimenUtil.getDimen(71);
    return Container(
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Container(
              height: itemHeight,
              width: itemWidth,
              child: GestureDetector(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/images/icon_ht.png",
                      width: DimenUtil.getDimen(28),
                      height: DimenUtil.getDimen(28),
                    ),
                    Text("话题",
                        style: TextStyle(fontSize: DimenUtil.getDimen(16)))
                  ],
                ),
                onTap: () {
                  MallToast.showToast("话题");
                },
              )),
          Container(
              height: itemHeight,
              width: itemWidth,
              child: GestureDetector(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/images/icon_youxuan.png",
                      width: DimenUtil.getDimen(28),
                      height: DimenUtil.getDimen(28),
                    ),
                    Text("优选",
                        style: TextStyle(fontSize: DimenUtil.getDimen(16)))
                  ],
                ),
                onTap: () {
                  MallToast.showToast("优选");
                },
              )),
          Container(
              height: itemHeight,
              width: itemWidth,
              child: GestureDetector(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/images/icon_tehui.png",
                      width: DimenUtil.getDimen(28),
                      height: DimenUtil.getDimen(28),
                    ),
                    Text("特惠",
                        style: TextStyle(fontSize: DimenUtil.getDimen(16)))
                  ],
                ),
                onTap: () {
                  MallToast.showToast("特惠");
                },
              )),
          Container(
              height: itemHeight,
              width: itemWidth,
              child: GestureDetector(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/images/icon_sign.png",
                      width: DimenUtil.getDimen(28),
                      height: DimenUtil.getDimen(28),
                    ),
                    Text("签到",
                        style: TextStyle(fontSize: DimenUtil.getDimen(16)))
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
        padding: EdgeInsets.only(
            top: DimenUtil.getDimen(10), bottom: DimenUtil.getDimen(10)),
        child: Stack(children: <Widget>[
          Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(left: DimenUtil.getDimen(20)),
                child: Image.asset("assets/images/icon_broadcast.png"),
              )),
          Center(
              child: Text(
            "广播通知",
            style: TextStyle(fontSize: DimenUtil.getDimen(13)),
          )),
          Container(
              margin: EdgeInsets.only(right: DimenUtil.getDimen(20)),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                      height: DimenUtil.getDimen(25),
                      child: GestureDetector(
                        child: Container(
                          padding: EdgeInsets.only(
                              left: DimenUtil.getDimen(5),
                              right: DimenUtil.getDimen(5),
                              top: DimenUtil.getDimen(2),
                              bottom: DimenUtil.getDimen(2)),
                          child: Text('详情',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: DimenUtil.getDimen(13))),
                        ),
                        onTap: () {
                          MallToast.showToast("查看详情");
                        },
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green),
                          borderRadius: BorderRadius.all(
                              Radius.circular(DimenUtil.getDimen(5)))))))
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
      if (_homeProductPanel != null) {
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
            margin: EdgeInsets.only(
                top: DimenUtil.getDimen(10),
                left: DimenUtil.getDimen(15),
                right: DimenUtil.getDimen(15)),
            child: Stack(
              children: <Widget>[
                Text("品牌制造商直供"),
                Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                              child: Text("更多推荐"),
                              margin: EdgeInsets.only(
                                  right: DimenUtil.getDimen(5))),
                          Image.asset(
                              ResourceUtil.getAssetImagePath(
                                  "icon_more_right.png"),
                              width: DimenUtil.getDimen(20),
                              height: DimenUtil.getDimen(20))
                        ]))
              ],
            )),
        null,
        SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: DimenUtil.getDimen(20),
            crossAxisSpacing: DimenUtil.getDimen(10),
            childAspectRatio: 1));
    return Container(
        margin: EdgeInsets.only(top: DimenUtil.getDimen(20)),
        child: _homeProductPanel);
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
    if (data == null) {
      return null;
    }
    return Container(
        padding: EdgeInsets.all(DimenUtil.getDimen(5)),
        color: Colors.grey[100],
        child: Column(
          children: <Widget>[
            Container(
                height: DimenUtil.getDimen(50),
                child: Stack(
                  children: <Widget>[
                    Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(data.name,
                                style: TextStyle(
                                    fontSize: DimenUtil.getDimen(16))),
                            Text(data.productCount.toString(),
                                style: TextStyle(
                                    fontSize: DimenUtil.getDimen(14),
                                    color: Colors.grey[400]))
                          ]),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                          margin:
                              EdgeInsets.only(bottom: DimenUtil.getDimen(5)),
                          child: Stack(
                              alignment: AlignmentDirectional.topCenter,
                              children: <Widget>[
                                Image.asset(ResourceUtil.getAssetImagePath(
                                    "icon_new.png")),
                                Container(
                                    child: Text(
                                      '新品',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: DimenUtil.getDimen(13)),
                                    ),
                                    margin: EdgeInsets.only(
                                        top: DimenUtil.getDimen(3)))
                              ])),
                    )
                  ],
                )),
            Expanded(
                child: GestureDetector(
                    child: Stack(
                      children: <Widget>[
                        Image.asset(
                          ResourceUtil.getAssetImagePath("default_3.jpg"),
                          width: DimenUtil.getDimen(80),
                          height: DimenUtil.getDimen(80),
                          fit: BoxFit.fill,
                        ),
                        FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: data.logo,
                            width: DimenUtil.getDimen(150),
                            height: DimenUtil.getDimen(105),
                            fit: BoxFit.fill)
                      ],
                    ),
                    onTap: () {
                      MallToast.showToast(data.name);
                    }))
          ],
        ));
  }
}
