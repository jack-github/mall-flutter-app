import 'package:flutter/material.dart';

class WidgetUtil {
  /// 创建横线
  /// @param color 颜色
  /// @param height 高度
  /// @return Widget
  /// @author lizhid
  /// @modify
  /// @date 2019/6/19 14:04
  static Widget createLine(Color color, double height) {
    return Container(
      height: height,
      color: color,
    );
  }
}
