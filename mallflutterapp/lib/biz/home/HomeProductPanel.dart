import 'package:flutter/material.dart';
import 'package:mallflutterapp/common/widget/WidgetUtil.dart';
import 'package:mallflutterapp/util/DimenUtil.dart';

import 'BaseHomePanelAdapter.dart';

/// 首页商铺列表
/// @author lizhid
/// @version V1.0.0
/// @date 2019/6/19
// ignore: must_be_immutable
class HomeProductPanel extends StatefulWidget {
  /// gridView 条目控件
  List<Widget> gridViewItemList;

  /// GridView样式
  SliverGridDelegate gridDelegate;

  /// 背景颜色
  Color backgroundColor;

  /// 商铺列表state
  HomeProductPanelState _homeProductPanelState;

  /// 适配器
  BaseHomePanelAdapter adapter;

  HomeProductPanel(this.gridViewItemList, this.gridDelegate,
      {this.backgroundColor = Colors.white, this.adapter})
      : super() {
    if (adapter != null) {
      setAdapter(adapter);
    }
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    _homeProductPanelState = HomeProductPanelState();
    return _homeProductPanelState;
  }

  /// 更新数据
  /// @param gridViewItemList
  /// @return void
  /// @author lizhid
  /// @modify
  /// @date 2019/6/19 15:34
  void updateItemList(List<Widget> gridViewItemList) {
    if (_homeProductPanelState == null) {
      return;
    }
    _homeProductPanelState._updateItemList(gridViewItemList);
  }

  /// 设置适配器
  /// @param adapter
  /// @return void
  /// @author lizhid
  /// @modify
  /// @date 2019/6/26 17:22
  void setAdapter(BaseHomePanelAdapter adapter) {
    this.adapter = adapter;
    this.adapter.bindDataChanged((List<Widget> data) {
      updateItemList(data);
    });
  }
}

/// 商铺列表state
/// @author lizhid
/// @version V1.0.0
/// @date 2019/6/19
class HomeProductPanelState extends State<HomeProductPanel> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: widget.backgroundColor,
        child: Column(
          children: <Widget>[
            WidgetUtil.createLine(Color(0xFFEEEEEE), DimenUtil.getDimen(1)),
            widget.adapter.getTopView(),
            Container(
                padding: EdgeInsets.only(
                    left: DimenUtil.getDimen(20),
                    right: DimenUtil.getDimen(20),
                    bottom: DimenUtil.getDimen(20)),
                child: widget.gridViewItemList == null
                    ? Text("暂无数据")
                    : GridView.builder(
                        primary: false,
                        shrinkWrap: true,
                        gridDelegate: widget.gridDelegate,
                        itemCount: widget.gridViewItemList.length,
                        itemBuilder: (context, index) {
                          return widget.gridViewItemList[index];
                        })),
            WidgetUtil.createLine(Color(0xFFEEEEEE), DimenUtil.getDimen(1))
          ],
        ));
  }

  /// 更新数据
  /// @param gridViewItemList
  /// @return void
  /// @author lizhid
  /// @modify
  /// @date 2019/6/19 15:34
  void _updateItemList(List<Widget> gridViewItemList) {
    setState(() {
      widget.gridViewItemList = gridViewItemList;
    });
  }
}
