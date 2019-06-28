import 'dart:ui';
import 'package:flutter/material.dart';

/// 屏幕适配工具
/// @author lizhid
/// @version V1.0.0
/// @date 2019/6/24
class DimenUtil {
  /// 设计稿宽度
  static double designW;

  /// 设计稿高度
  static double designH;

  /// 屏幕分辨率
  static Size deviceSize;

  /// 屏幕像素密度
  static double devicePixelRatio;

  /// 初始化设计尺寸
  /// @param width 设计稿宽度
  /// @param height 设计稿高度
  /// @return void
  /// @author lizhid
  /// @modify
  /// @date 2019/6/24 16:20
  static void initDimenUtil(
      double width, double height, Size size, double devicePixelRatio) {
    designW = width;
    designH = height;
    deviceSize = size;
    DimenUtil.devicePixelRatio = devicePixelRatio;
  }

  /// 获取dp
  /// @param num
  /// @return double dp
  /// @author lizhid
  /// @modify
  /// @date 2019/6/24 16:26
  static double getDimen(double num) {
    if (deviceSize == null) {
      deviceSize = window.physicalSize;
    }
//    print("designW：" +
//        designW.toString() +
//        " --designH：" +
//        designH.toString() +
//        " --deviceW：" +
//        deviceSize.width.toString() +
//        " --deviceH：" +
//        deviceSize.height.toString() +
//        " --devicePixelRatio：" +
//        devicePixelRatio.toString());
    double dimen = deviceSize.width / designW * num / devicePixelRatio;
   // print("num：" + num.toString() + "--dimen：" + dimen.toString());
    return dimen;
  }

  /// 获取px
  /// @param dp
  /// @return double px
  /// @author lizhid
  /// @modify
  /// @date 2019/6/27 16:36
  static double getDimenPX(double dp) {
    if (deviceSize == null) {
      deviceSize = window.physicalSize;
    }
    double px = dp * devicePixelRatio * designW / deviceSize.width;
    return px;
  }
}
