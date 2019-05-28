import 'dart:ui';

import 'package:fluttertoast/fluttertoast.dart';

/// toast
/// @author lizhid
/// @version V1.0.0
/// @date 2019/5/28
class MallToast {
  /// 显示toast
  /// @param msg 提示消息
  /// @param toastLength 提示时长
  /// @param timeInSecForIos iOS显示时长
  /// @param fontSize 字体大小
  /// @param gravity 布局位置
  /// @param backgroundColor 背景颜色
  /// @param textColor 文本颜色
  /// @return void
  /// @author lizhid
  /// @modify
  /// @date 2019/5/28 14:09
  static void showToast(String msg,
      {Toast toastLength = Toast.LENGTH_SHORT,
      int timeInSecForIos = 1,
      double fontSize = 16.0,
      ToastGravity gravity = ToastGravity.CENTER,
      Color backgroundColor = const Color(0xd0000000),
      Color textColor = const Color(0xffffffff)}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: toastLength,
        timeInSecForIos: timeInSecForIos,
        fontSize: fontSize,
        backgroundColor: backgroundColor,
        textColor: textColor,
        gravity: gravity);
  }
}
