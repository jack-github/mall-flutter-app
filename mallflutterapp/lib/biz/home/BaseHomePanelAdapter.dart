import 'package:flutter/material.dart';

/// 数据更新
/// @author lizhid
/// @version V1.0.0
/// @date 2019/6/26
typedef void NotifyDataSetChanged(List<Widget> data);

/// 首页商铺推荐适配器
/// @author lizhid
/// @version V1.0.0
/// @date 2019/6/26
abstract class BaseHomePanelAdapter {
  ///数据状态监听
  NotifyDataSetChanged _notifyDataSetChanged;

  /// 绑定数据监听
  /// @param callback
  /// @return void
  /// @author lizhid
  /// @modify
  /// @date 2019/6/26 17:21
  void bindDataChanged(NotifyDataSetChanged callback) {
    this._notifyDataSetChanged = callback;
  }

  /// 设置数据
  /// @return
  /// @author lizhid
  /// @modify
  /// @date 2019/6/26 16:48
  void setData(dynamic data);

  /// 获取顶部视图
  /// @return Widget
  /// @author lizhid
  /// @modify
  /// @date 2019/6/26 16:48
  Widget getTopView();

  /// 获取数量
  /// @return int
  /// @author lizhid
  /// @modify
  /// @date 2019/6/26 16:48
  int getCount();

  /// 获取条目数据
  /// @return int
  /// @author lizhid
  /// @modify
  /// @date 2019/6/26 16:48
  Object getItem(int position);

  /// 获取控件视图
  /// @return int
  /// @author lizhid
  /// @modify
  /// @date 2019/6/26 16:48
  Widget getView(int position);

  /// 获取控件列表
  /// @return List<Widget>
  /// @author lizhid
  /// @modify
  /// @date 2019/6/26 17:29
  List<Widget> getViewList() {
    int dataSize = getCount();
    if (dataSize == 0) {
      return null;
    }
    List<Widget> dataList = new List();
    for (int i = 0; i < dataSize; i++) {
      dataList.add(getView(i));
    }
    return dataList;
  }

  /// 更新数据
  /// @param data
  /// @return void
  /// @author lizhid
  /// @modify
  /// @date 2019/6/26 17:17
  void notifyDataSetChanged(dynamic data) {
     /// 更新数据
     setData(data);
    if (_notifyDataSetChanged != null) {
      _notifyDataSetChanged(getViewList());
    }
  }
}
