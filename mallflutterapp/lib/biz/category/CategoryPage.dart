import 'package:flutter/material.dart';
import 'package:annotation_route/route.dart';
import 'package:mallflutterapp/biz/category/WeChatCategoryRespEntity.dart';
import 'package:mallflutterapp/common/ViewConst.dart';
import 'package:mallflutterapp/net/ApiHost.dart';
import 'package:mallflutterapp/net/BaseResponseEntity.dart';
import 'package:mallflutterapp/net/MallException.dart';
import 'package:mallflutterapp/net/RequestManager.dart';
import 'package:mallflutterapp/net/RequestMethodEnum.dart';
import 'package:mallflutterapp/net/RequestTypeEnum.dart';
import 'package:mallflutterapp/route/route.dart';

/// 分类界面
/// @author lizhid
/// @version V1.0.0
/// @date 2019/5/22
@ARoute(url: ViewConst.ROUTE_CATEGORY_CATEGORYPAGE)
class CategoryPage extends StatefulWidget {
  dynamic option;

  CategoryPage(this.option) : super();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new CategoryPageState();
  }
}

/// 分类视图
/// @author lizhid
/// @version V1.0.0
/// @date 2019/5/22
class CategoryPageState extends State<CategoryPage> {
  /// 微信精选
  WeChatCategoryRespEntity _weChatCategoryRespEntity =
      new WeChatCategoryRespEntity();

  /// 列表数量
  int _listCount = 0;

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return new Scaffold(
        appBar: AppBar(
          title: Text("Category Page"),
        ),
        body: ListView.builder(
            itemExtent: 40,
            itemCount: _listCount,
            itemBuilder: (context, i) {
              return ListTile(
                title: Text(_weChatCategoryRespEntity.list[i].name),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.black26,
                ),
                onTap: () {
                  Map<String, dynamic> bundle = new Map();
                  bundle["cid"] = _weChatCategoryRespEntity.list[i].cid;
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return MallRoute.getPage(
                        ViewConst.ROUTE_CATEGORY_CATEGORYPAGE_LIST, bundle);
                  }));
                },
              );
            }));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _requestData();
  }

  /// 请求微信精选分类
  /// @return
  /// @author lizhid
  /// @modify
  /// @date 2019/5/28 19:26
  void _requestData() {
    RequestManager.httpRequest<WeChatCategoryRespEntity>(
        RequestTypeEnum.CACHE_AND_NET, true, ApiHost.weChat_article_category,
        methodType: RequestMethodEnum.GET,
        successCallback: (BaseResponseEntity<WeChatCategoryRespEntity> data) {
      if (data == null) {
        return;
      }
      setState(() {
        _weChatCategoryRespEntity = data.result;
        _listCount = _weChatCategoryRespEntity.list.length;
      });
    }, errorCallBack: (MallException e) {});
  }
}
