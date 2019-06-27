import 'package:flutter/material.dart';
import 'package:mallflutterapp/common/MallToast.dart';
import 'package:mallflutterapp/common/widget/ResourceUtil.dart';
import 'package:mallflutterapp/data/home/model/ContentRespEntity.dart';
import 'package:mallflutterapp/util/DimenUtil.dart';
import 'package:transparent_image/transparent_image.dart';
import 'BaseHomePanelAdapter.dart';

/// 推荐商品适配器
/// @author lizhid
/// @version V1.0.0
/// @date 2019/6/27
class RecommendBrandAdapter extends BaseHomePanelAdapter {
  /// 推荐数据
  List<BrandListListBean> brandList;

  RecommendBrandAdapter({this.brandList}):super();

  @override
  void setData(dynamic data) {
    brandList = data;
  }

  @override
  int getCount() {
    // TODO: implement getCount
    return brandList == null ? 0 : brandList.length;
  }

  @override
  Object getItem(int position) {
    if (brandList == null) {
      return null;
    }
    if (position >= brandList.length) {
      return null;
    }
    return brandList[position];
  }

  @override
  Widget getTopView() {
    // TODO: implement getTopView
    return Container(
        margin: EdgeInsets.only(
            top: DimenUtil.getDimen(10),
            left: DimenUtil.getDimen(15),
            right: DimenUtil.getDimen(15)),
        child: Stack(
          children: <Widget>[
            Text("品牌制造商直供"),
            Align(
                alignment: Alignment.centerRight,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                          child: Text("更多推荐"),
                          margin: EdgeInsets.only(
                              right: DimenUtil.getDimen(5))),
                      Image.asset(
                          ResourceUtil.getAssetImagePath(
                              "icon_more_right.png"),
                          width: DimenUtil.getDimen(20),
                          height: DimenUtil.getDimen(20))
                    ]))
          ],
        ));
  }

  @override
  Widget getView(int position) {
    // TODO: implement getView
    return _createBrandPanelItem(brandList[position]);
  }

  /// 创建推荐商品条目
  /// @param data 数据源
  /// @return Widget
  /// @author lizhid
  /// @modify
  /// @date 2019/6/19 16:20
  Widget _createBrandPanelItem(BrandListListBean data) {
    if (data == null) {
      return null;
    }
    return Container(
        padding: EdgeInsets.all(DimenUtil.getDimen(5)),
        color: Colors.grey[100],
        child: Column(
          children: <Widget>[
            Container(
                height: DimenUtil.getDimen(50),
                child: Stack(
                  children: <Widget>[
                    Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(data.name,
                                style: TextStyle(
                                    fontSize: DimenUtil.getDimen(16))),
                            Text(data.productCount.toString(),
                                style: TextStyle(
                                    fontSize: DimenUtil.getDimen(14),
                                    color: Colors.grey[400]))
                          ]),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                          margin:
                          EdgeInsets.only(bottom: DimenUtil.getDimen(5)),
                          child: Stack(
                              alignment: AlignmentDirectional.topCenter,
                              children: <Widget>[
                                Image.asset(ResourceUtil.getAssetImagePath(
                                    "icon_new.png")),
                                Container(
                                    child: Text(
                                      '新品',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: DimenUtil.getDimen(13)),
                                    ),
                                    margin: EdgeInsets.only(
                                        top: DimenUtil.getDimen(3)))
                              ])),
                    )
                  ],
                )),
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
                            image: data.logo,
                            width: DimenUtil.getDimen(150),
                            height: DimenUtil.getDimen(105),
                            fit: BoxFit.fill)
                      ],
                    ),
                    onTap: () {
                      MallToast.showToast(data.name);
                    }))
          ],
        ));
  }


}
