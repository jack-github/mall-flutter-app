import 'package:flutter/material.dart';
import 'package:annotation_route/route.dart';
import 'package:mallflutterapp/biz/category/WeChatCategoryRespEntity.dart';
import 'package:mallflutterapp/common/ViewConst.dart';
import 'package:mallflutterapp/net/ApiHost.dart';
import 'package:mallflutterapp/net/BaseResponseEntity2.dart';
import 'package:mallflutterapp/net/MallException.dart';
import 'package:mallflutterapp/net/RequestManager2.dart';
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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: AppBar(
          title: Text("微信精选"),
        ),
        body: ListView(children: _createListItem()));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _requestData();
  }

  /// 创建ListView条目
  /// @return Widget
  /// @author lizhid
  /// @modify
  /// @date 2019/5/29 8:48
  List<Widget> _createListItem() {
    if (_weChatCategoryRespEntity == null || _weChatCategoryRespEntity.list == null) {
      List<Widget> titleList = new List();
      titleList.add(new Text(''));
      return titleList;
    }
    List<ListTile> titleList = new List();
    _weChatCategoryRespEntity.list
        .forEach((WeChatCategoryRespEntityResult result) {
      titleList.add(_createItemWidget(result));
    });
    List<Widget> dividedList =
        ListTile.divideTiles(context: context, tiles: titleList).toList();
    return dividedList;
  }

  /// 创建条目视图
  /// @param result 数据
  /// @return Widget
  /// @author lizhid
  /// @modify
  /// @date 2019/5/29 9:15
  Widget _createItemWidget(WeChatCategoryRespEntityResult result) {
    if (result == null) {
      return null;
    }
    return ListTile(
      title: Container(
        child: Text(result.name),
      ),
      trailing: Container(
          child: Icon(Icons.keyboard_arrow_right, color: Colors.black26)),
      onTap: () {
        Map<String, dynamic> bundle = new Map();
        bundle["cid"] = result.cid;
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return MallRoute.getPage(
              ViewConst.ROUTE_CATEGORY_CATEGORYPAGE_LIST, bundle);
        }));
      },
    );
  }

  /// 请求微信精选分类
  /// @return
  /// @author lizhid
  /// @modify
  /// @date 2019/5/28 19:26
  void _requestData() {
    RequestManager2.httpRequest(
        RequestTypeEnum.CACHE_AND_NET, true, ApiHost.weChat_article_category,
        methodType: RequestMethodEnum.GET,
        successCallback: (BaseResponseEntity2<WeChatCategoryRespEntity> data) {
      if (data == null) {
        return;
      }
      setState(() {
        _weChatCategoryRespEntity = data.result;
      });
    }, errorCallBack: (MallException e) {});
  }
}
