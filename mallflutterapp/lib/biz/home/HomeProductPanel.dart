import 'package:flutter/material.dart';
import 'package:mallflutterapp/common/widget/WidgetUtil.dart';

/// 首页商铺列表
/// @author lizhid
/// @version V1.0.0
/// @date 2019/6/19
class HomeProductPanel extends StatefulWidget {
  /// 标题布局控件
  Widget titleWidget;

  /// gridView 条目控件
  List<Widget> gridViewItemList;

  /// GridView样式
  SliverGridDelegate gridDelegate;

  /// 背景颜色
  Color backgroundColor;

  /// 商铺列表state
  HomeProductPanelState _homeProductPanelState;

  HomeProductPanel(this.titleWidget, this.gridViewItemList, this.gridDelegate,
      {this.backgroundColor = Colors.white})
      : super();

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
    _homeProductPanelState.updateItemList(gridViewItemList);
  }
}

/// 商铺列表state
/// @author lizhid
/// @version V1.0.0
/// @date 2019/6/19
class HomeProductPanelState extends State<HomeProductPanel> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        color: widget.backgroundColor,
        child: Column(
          children: <Widget>[
            WidgetUtil.createLine(Color(0xFFBDBDBD), 1),
            widget.titleWidget,
            Container(
                padding: EdgeInsets.all(20),
                child: widget.gridViewItemList == null
                    ? Text("暂无数据")
                    : GridView.builder(
                        gridDelegate: widget.gridDelegate,
                        itemCount: widget.gridViewItemList == null
                            ? 0
                            : widget.gridViewItemList.length,
                        itemBuilder: (context, index) {
                          return widget.gridViewItemList[index];
                        }))
          ],
        ));
  }

  /// 更新数据
  /// @param gridViewItemList
  /// @return void
  /// @author lizhid
  /// @modify
  /// @date 2019/6/19 15:34
  void updateItemList(List<Widget> gridViewItemList) {
    setState(() {
      widget.gridViewItemList = gridViewItemList;
    });
  }
}
