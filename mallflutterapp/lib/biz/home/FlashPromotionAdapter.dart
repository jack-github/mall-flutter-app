import 'package:flutter/material.dart';
import 'package:mallflutterapp/common/MallToast.dart';
import 'package:mallflutterapp/common/widget/AutoSizeText.dart';
import 'package:mallflutterapp/common/widget/ResourceUtil.dart';
import 'package:mallflutterapp/data/home/model/ContentRespEntity.dart';
import 'package:mallflutterapp/util/DimenUtil.dart';
import 'package:transparent_image/transparent_image.dart';
import 'BaseHomePanelAdapter.dart';

/// 秒杀商品
/// @author lizhid
/// @version V1.0.0
/// @date 2019/6/27
class FlashPromotionAdapter extends BaseHomePanelAdapter {
  /// 秒杀商品
  HomeFlashPromotionBean homeFlashPromotionBean;

  FlashPromotionAdapter({this.homeFlashPromotionBean}) : super();

  @override
  void setData(dynamic data) {
    homeFlashPromotionBean = data;
  }

  @override
  int getCount() {
    if (homeFlashPromotionBean == null ||
        homeFlashPromotionBean.productList == null) {
      return 0;
    }

    return homeFlashPromotionBean.productList == null
        ? 0
        : homeFlashPromotionBean.productList.length;
  }

  @override
  Object getItem(int position) {
    if (homeFlashPromotionBean.productList == null) {
      return null;
    }
    if (position >= homeFlashPromotionBean.productList.length) {
      return null;
    }
    return homeFlashPromotionBean.productList[position];
  }

  @override
  Widget getTopView() {
     print("========"+format(homeFlashPromotionBean.nextStartTime).toString());
    // TODO: implement getTopView
    return Container(
        margin: EdgeInsets.only(
            top: DimenUtil.getDimen(10),
            left: DimenUtil.getDimen(15),
            right: DimenUtil.getDimen(15)),
        child: Stack(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Text(
                    "秒杀专场",
                    style: TextStyle(
                        fontSize: DimenUtil.getDimen(16), color: Colors.black),
                  ),
                  Text(
                    "下一场"+homeFlashPromotionBean.nextStartTime.toString()+"开始",
                    style: TextStyle(
                        fontSize: DimenUtil.getDimen(16), color: Colors.grey[400]),
                  ),
                ],
              ),
            ),
            Align(
                alignment: Alignment.centerRight,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                          child: Text("更多推荐"),
                          margin:
                              EdgeInsets.only(right: DimenUtil.getDimen(5))),
                      Image.asset(
                          ResourceUtil.getAssetImagePath("icon_more_right.png"),
                          width: DimenUtil.getDimen(20),
                          height: DimenUtil.getDimen(20))
                    ]))
          ],
        ));
  }

  String format(DateTime data){
    return data.year.toString();
  }

  @override
  Widget getView(int position) {
    // TODO: implement getView
    return _createBrandPanelItem(homeFlashPromotionBean.productList[position]);
  }

  /// 创建推荐商品条目
  /// @param data 数据源
  /// @return Widget
  /// @author lizhid
  /// @modify
  /// @date 2019/6/19 16:20
  Widget _createBrandPanelItem(ProductListListBean data) {
    if (data == null) {
      return null;
    }
    return Container(
        padding: EdgeInsets.all(DimenUtil.getDimen(5)),
        child: Column(
          children: <Widget>[
            Expanded(
                child: GestureDetector(
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: <Widget>[
                        Image.asset(
                          ResourceUtil.getAssetImagePath("default_3.jpg"),
                          width: DimenUtil.getDimen(52),
                          height: DimenUtil.getDimen(47),
                          fit: BoxFit.fill,
                        ),
                        FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: data.pic,
                            width: DimenUtil.getDimen(100),
                            height: DimenUtil.getDimen(81),
                            fit: BoxFit.fill),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            width: DimenUtil.getDimen(40),
                            height: DimenUtil.getDimen(40),
                            alignment: AlignmentDirectional.center,
                            child: AutoSizeText(
                              "￥" + data.price.toInt().toString(),
                              DimenUtil.getDimen(35),
                              style: TextStyle(
                                  fontSize: DimenUtil.getDimen(15),
                                  color: Colors.white),
                            ),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.red),
                          ),
                        )
                      ],
                    ),
                    onTap: () {
                      MallToast.showToast(data.name);
                    })),
            Container(
                alignment: AlignmentDirectional.center,
                child: Text("秒杀价￥" + data.flashPromotionPrice.toString(),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: DimenUtil.getDimen(14), color: Colors.red))),
            Container(
                alignment: AlignmentDirectional.center,
                child: Text(data.name.toString(),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: DimenUtil.getDimen(14),
                        color: Colors.black))),
            Container(
                alignment: AlignmentDirectional.center,
                child: Text(data.subTitle.toString(),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: DimenUtil.getDimen(14),
                        color: Colors.grey[400]))),
          ],
        ));
  }
}
