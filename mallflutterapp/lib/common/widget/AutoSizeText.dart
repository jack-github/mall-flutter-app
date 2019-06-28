import 'package:flutter/material.dart';

/// 自动缩放字体大小文本控件
/// @author lizhid
/// @version V1.0.0
/// @date 2019/6/27
class AutoSizeText extends StatefulWidget {
  /// 容器宽度
  double width;

  /// 样式
  TextStyle style;

  /// 内容
  String text;

  /// 文字大小 默认大小13
  double _textSize = 13;

  /// 文字大小 最小值
  double _minFontSize = 5;
  /// 显示位置
  TextAlign textAlign;

  AutoSizeText(this.text, this.width, {this.style,this.textAlign}) : super();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return createAutoSizeTextState();
  }

  /// 初始化
  /// @return void
  /// @author lizhid
  /// @modify
  /// @date 2019/6/28 15:55
  AutoSizeTextState createAutoSizeTextState() {
    _minFontSize = width / text.length;
    if (style == null) {
      style = new TextStyle(fontSize: _textSize);
    } else if (style.fontSize == null) {
      style = style.copyWith(fontSize: _textSize);
    }
    TextPainter _textPainter = new TextPainter(
        textDirection: TextDirection.ltr,
        text: TextSpan(text: text, style: style));
    _textPainter.layout();
    return new AutoSizeTextState(style, _textPainter);
  }
}

/// 自动缩放字体大小文本控件状态监听器
/// @author lizhid
/// @version V1.0.0
/// @date 2019/6/27
class AutoSizeTextState extends State<AutoSizeText>
    with TickerProviderStateMixin {
  /// 控件标示
  GlobalKey _globalKey = new GlobalKey();

  /// 动画控制器
  AnimationController _controller;

  double _fontSize = 0;

  /// 文本绘制工具
  TextPainter _textPainter;

  /// 样式
  TextStyle _textStyle;

  AutoSizeTextState(this._textStyle, this._textPainter) : super();

  @override
  Widget build(BuildContext context) {
    print("_fontSize-----0------" + _fontSize.toString());
    return new ScaleTransition(
      scale: CurvedAnimation(
          parent: _controller, curve: Interval(0, 1, curve: Curves.easeOut)),
      child: Text(widget.text,
          key: _globalKey, style: _textStyle.copyWith(fontSize: _fontSize),textAlign: widget.textAlign),
    );
  }

  @override
  void initState() {
    super.initState();
    _initFontSize();
  }

  /// 初始化字体大小
  /// @return void
  /// @author lizhid
  /// @modify
  /// @date 2019/6/27 16:16
  void _initFontSize() {
    _fontSize = _textStyle.fontSize;
    print("_fontSize-----0------" + _fontSize.toString());
    _controller = new AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    _controller.addStatusListener((status) {
      /// 容器控件宽度
      double parentWidth = widget.width ?? _globalKey.currentContext.size.width;

      /// 判断是否为动画结束
      if (status == AnimationStatus.completed) {
        double textWidth = _textPainter.width;
        double fontSize = _textStyle.fontSize;

        /// 判断 文本控件是否大于
        if (textWidth > parentWidth) {
          while (textWidth > parentWidth && fontSize > widget._minFontSize) {
            fontSize -= 0.5;
            _textPainter.text = TextSpan(
                text: widget.text,
                style: _textStyle.copyWith(fontSize: fontSize));
            _textPainter.layout();
            textWidth = _textPainter.width;
          }
          setState(() {
            _fontSize = fontSize;
            print("_fontSize-----------" + _fontSize.toString());
          });
        }
      }
    });
    _controller.forward();
  }
}
