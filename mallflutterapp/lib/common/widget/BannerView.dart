import 'dart:async';

import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

/// 点击事件回调
typedef void OnBannerItemClick(int position, BannerItemBean entity);

/// 最大页数
const MAX_COUNT = 0x7fffffff;

/// banner控件
/// @author lizhid
/// @version V1.0.0
/// @date 2019/6/17
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
  List<BannerItemBean> datas = new List();

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

  BannerView(this.datas,
      {this.bannerHeight = 200,
      this.waitMillisecondsTime = 2000,
      this.scrollMillisecondsTime = 400,
      this.onBannerItemClick})
      : super();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BannerViewState();
  }
}

/// banner控件实现
/// @author lizhid
/// @version V1.0.0
/// @date 2019/6/17
class BannerViewState extends State<BannerView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _createPageView();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initBannerItem();
    _updateBannerPoint(0);
    restartTimer();
  }

  /// 开始倒计时
  /// @return void
  /// @author lizhid
  /// @modify
  /// @date 2019/6/13 20:16
  void restartTimer() {
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
        margin: EdgeInsets.only(left: 10),
        width: 10,
        height: 10,
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
  void initBannerItem() {
    if (widget.datas == null) {
      return;
    }
    for (int i = 0; i < widget.datas.length; i++) {
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
          PageView.builder(
              itemBuilder: (context, index) {
                return widget
                    ._bannerItemList[index % widget._bannerItemList.length];
              },
              controller: widget.pageController,
              physics: const PageScrollPhysics(
                  parent: const ClampingScrollPhysics()),
              onPageChanged: (index) {
                widget._selectIndex = index;
                int pointIndex = index % widget._bannerItemList.length;
                print("---------" + pointIndex.toString());
                _updateBannerPoint(pointIndex);
              }),
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

  /// 创建条目
  /// @param index
  /// @return Widget
  /// @author lizhid
  /// @modify
  /// @date 2019/5/30 11:53
  Widget _createPageViewItem(int index) {
    return GestureDetector(
      child: FadeInImage.memoryNetwork(
        image:widget.datas[index]._imagePath,
        placeholder:kTransparentImage,
        fit: BoxFit.cover,
      ),
      onTapDown: (TapDownDetails details) {
        clearTimer();
      },
      onTap: () {
        if (widget.onBannerItemClick != null) {
          widget.onBannerItemClick(
              widget._selectIndex, widget.datas[widget._selectIndex]);
        }
      },
      onTapCancel: () {
        restartTimer();
      },
      onTapUp: (TapUpDetails details) {
        restartTimer();
      },
    );
  }
}

/// banner实体类
/// @author lizhid
/// @version V1.0.0
/// @date 2019/6/17
class BannerItemBean {
  /// 图片路径
  String _imagePath;

  BannerItemBean(this._imagePath) : super();
}
