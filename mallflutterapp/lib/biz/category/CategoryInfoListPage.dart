import 'package:annotation_route/route.dart';
import 'package:flutter/material.dart';
import 'package:mallflutterapp/common/ViewConst.dart';
import 'package:mallflutterapp/net/ApiHost.dart';
import 'package:mallflutterapp/net/BaseResponseEntity.dart';
import 'package:mallflutterapp/net/MallException.dart';
import 'package:mallflutterapp/net/RequestManager.dart';
import 'package:mallflutterapp/net/RequestMethodEnum.dart';
import 'package:mallflutterapp/net/RequestTypeEnum.dart';

import 'CategoryInfoListRequestEntity.dart';
import 'CategoryInfoListRespEntity.dart';

@ARoute(url: ViewConst.ROUTE_CATEGORY_CATEGORYPAGE_LIST)
class CategoryInfoListPage extends StatefulWidget {
  dynamic option;

  CategoryInfoListPage(this.option) : super();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new CategoryInfoListPageState(option);
  }
}

class CategoryInfoListPageState extends State<CategoryInfoListPage> {
  dynamic option;
  CategoryInfoListRespEntity _categoryInfoListRespEntity = null;
  int _listCount = 0;

  CategoryInfoListPageState(this.option) : super();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("精选详情")),
      body: Text(_categoryInfoListRespEntity == null?"":_categoryInfoListRespEntity.toJson().toString()),
    );
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
    CategoryInfoListRequestEntity param = new CategoryInfoListRequestEntity();
    param.cid = option.bundle['cid'];
    RequestManager.httpRequest<CategoryInfoListRespEntity>(
        RequestTypeEnum.CACHE_AND_NET, true, ApiHost.weChat_article_search,
        param: param, methodType: RequestMethodEnum.GET,
        successCallback: (BaseResponseEntity<CategoryInfoListRespEntity> data) {
      if (data == null) {
        return;
      }
      setState(() {
        _categoryInfoListRespEntity = data.result;
        _listCount = _categoryInfoListRespEntity.xList.length;
      });
    }, errorCallBack: (MallException e) {});
  }
}
