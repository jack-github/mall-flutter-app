import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mallflutterapp/util/DimenUtil.dart';
import 'package:transparent_image/transparent_image.dart';

/// 点击事件回调
typedef void OnBannerItemClick(int position, BannerItemBean entity);

/// 最大页数
const MAX_COUNT = 0x7fffffff;

/// banner控件
/// @author lizhid
/// @version V1.0.0
/// @date 2019/6/17
// ignore: must_be_immutable
class BannerView extends StatefulWidget {
  /// 选择位置
  int _selectIndex = 0;

  /// 自动滚动等待时间
  int waitMillisecondsTime;

  /// 滚动时间
  int scrollMillisecondsTime;

  /// banner高度
  double bannerHeight;

  /// 数据源
  List<BannerItemBean> dataList = new List();

  /// banner控件列表
  List<Widget> _bannerItemList = new List();

  /// banner指示点控件列表
  List<Widget> _bannerPointList = new List();

  /// pageView滚动控制器
  PageController pageController = new PageController();

  /// 定时器
  Timer _timer;

  /// 点击回调
  OnBannerItemClick onBannerItemClick;

  /// banner控件state
  BannerViewState _bannerViewState;

  /// 默认图片
  String defaultImageAssetPath;

  BannerView(this.dataList,
      {this.bannerHeight,
      this.waitMillisecondsTime = 4000,
      this.scrollMillisecondsTime = 400,
      this.onBannerItemClick,
      this.defaultImageAssetPath = "assets/images/default_3.jpg"})
      : super(){
      if( this.bannerHeight == null) {
        this.bannerHeight = DimenUtil.getDimen(200);
      }
  }


  @override
  State<StatefulWidget> createState() {
    _bannerViewState = BannerViewState();
    return _bannerViewState;
  }

  /// 更新数据
  /// @param dataList 数据
  /// @return void
  /// @author lizhid
  /// @modify
  /// @date 2019/6/18 16:03
  void updateBannerData(List<BannerItemBean> dataList) {
    if (_bannerViewState == null) {
      return;
    }
    _bannerViewState.updateBannerData(dataList);
  }
}

/// banner控件实现
/// @author lizhid
/// @version V1.0.0
/// @date 2019/6/17
class BannerViewState extends State<BannerView> {
  @override
  Widget build(BuildContext context) {
    return _createPageView();
  }

  @override
  void initState() {
    super.initState();
    _updateBannerView();
  }

  @override
  void dispose() {
    super.dispose();
    widget.pageController.dispose();
    clearTimer();
  }

  /// 更新banner 数据
  /// @param dataList
  /// @return void
  /// @author lizhid
  /// @modify
  /// @date 2019/6/18 16:36
  void updateBannerData(List<BannerItemBean> dataList) {
    setState(() {
      widget.dataList = dataList;
      _updateBannerView();
    });
  }

  /// 更新版本数据
  /// @return void
  /// @author lizhid
  /// @modify
  /// @date 2019/6/18 15:57
  void _updateBannerView() {
    if (widget.dataList == null || widget.dataList.length == 0) {
      return;
    }
    _initBannerItem();
    _updateBannerPoint(0);
    _restartTimer();
  }

  /// 开始倒计时
  /// @return void
  /// @author lizhid
  /// @modify
  /// @date 2019/6/13 20:16
  void _restartTimer() {
    clearTimer();
    widget._timer = new Timer.periodic(
        new Duration(milliseconds: widget.waitMillisecondsTime), (Timer timer) {
      // ignore: invalid_use_of_protected_member
      if (widget.pageController.positions.isNotEmpty) {
        widget._selectIndex = widget.pageController.page.round() + 1;
        widget.pageController.animateToPage(widget._selectIndex,
            duration: new Duration(milliseconds: widget.scrollMillisecondsTime),
            curve: Curves.linear);
        setState(() {});
      }
    });
  }

  /// 更新指示点
  /// @return void
  /// @author lizhid
  /// @modify
  /// @date 2019/6/14 17:15
  void _updateBannerPoint(int index) {
    if (widget._bannerPointList == null) {
      return;
    }
    int itemSize = widget._bannerPointList.length;
    if (index < 0 || index >= itemSize) {
      return;
    }
    Widget normalPoint = _createBannerPoint(true);
    Widget selectPoint = _createBannerPoint(false);
    List<Widget> newPointList = new List();
    for (int i = 0; i < itemSize; i++) {
      if (index == i) {
        newPointList.add(selectPoint);
      } else {
        newPointList.add(normalPoint);
      }
    }
    setState(() {
      widget._bannerPointList = newPointList;
    });
  }

  /// 创建指示点
  /// @param index 位置
  /// @return Widget
  /// @author lizhid
  /// @modify
  /// @date 2019/6/14 8:51
  Widget _createBannerPoint(bool normal) {
    return Container(
        margin: EdgeInsets.only(left: DimenUtil.getDimen(10)),
        width: DimenUtil.getDimen(10),
        height: DimenUtil.getDimen(10),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: normal ? Colors.grey[400] : Colors.white));
  }

  /// 清空计时器
  /// @return void
  /// @author lizhid
  /// @modify
  /// @date 2019/6/13 20:09
  void clearTimer() {
    if (widget._timer != null) {
      widget._timer.cancel();
      widget._timer = null;
    }
  }

  /// 初始化 banner条目
  /// @return void
  /// @author lizhid
  /// @modify
  /// @date 2019/6/13 19:40
  void _initBannerItem() {
    if (widget.dataList == null) {
      return;
    }
    if (widget._bannerItemList.length > 0) {
      widget._bannerItemList.clear();
    }
    if (widget._bannerPointList.length > 0) {
      widget._bannerPointList.clear();
    }
    for (int i = 0; i < widget.dataList.length; i++) {
      widget._bannerItemList.add(_createPageViewItem(i));
      widget._bannerPointList.add(_createBannerPoint(true));
    }
  }

  /// 创建pageView
  /// @return Widget
  /// @author lizhid
  /// @modify
  /// @date 2019/5/30 13:44
  Widget _createPageView() {
    return Container(
        height: widget.bannerHeight,
        child: Stack(children: <Widget>[
          Center(
              child: Image.asset(widget.defaultImageAssetPath,width: DimenUtil.getDimen(80),height: DimenUtil.getDimen(80))),
          PageView.builder(
              itemCount: widget._bannerItemList.length > 0 ? MAX_COUNT : 0,
              itemBuilder: (context, index) {
                return widget
                    ._bannerItemList[index % widget._bannerItemList.length];
              },
              controller: widget.pageController,
              physics: const PageScrollPhysics(
                  parent: const ClampingScrollPhysics()),
              onPageChanged: _onPageChanged),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget._bannerPointList,
                  )))
        ]));
  }

  /// 页面变化
  /// @param index
  /// @return void
  /// @author lizhid
  /// @modify
  /// @date 2019/6/19 8:40
  void _onPageChanged(index) {
    widget._selectIndex = index;
    if (widget._bannerItemList != null && widget._bannerItemList.length > 0) {
      int pointIndex = index % widget._bannerItemList.length;
      _updateBannerPoint(pointIndex);
    }
  }

  /// 创建条目
  /// @param index
  /// @return Widget
  /// @author lizhid
  /// @modify
  /// @date 2019/5/30 11:53
  Widget _createPageViewItem(int index) {
    return GestureDetector(
        child: FadeInImage.memoryNetwork(
          image: widget.dataList[index]._imagePath,
          placeholder: kTransparentImage,
          fit: BoxFit.cover,
        ),
        onTapDown: (TapDownDetails details) {
          clearTimer();
        },
        onTap: () {
          if (widget.onBannerItemClick != null) {
            int index = widget._selectIndex % widget._bannerItemList.length;
            widget.onBannerItemClick(index, widget.dataList[index]);
          }
        },
        onTapUp: (TapUpDetails details) {
          _restartTimer();
          print("-----------------onTapUp");
        },
        onTapCancel: () {
          _restartTimer();
          print("-----------------onTapCancel");
        });
  }
}

/// banner实体类
/// @author lizhid
/// @version V1.0.0
/// @date 2019/6/17
class BannerItemBean {
  /// 图片路径
  String _imagePath;

  /// 跳转链接
  String url;

  /// 标题
  String title;

  BannerItemBean(this._imagePath, this.url, this.title) : super();
}
