import 'package:annotation_route/route.dart';
import 'package:flutter/material.dart';
import 'package:mallflutterapp/common/MallToast.dart';
import 'package:mallflutterapp/common/ViewConst.dart';
import 'package:mallflutterapp/net/ApiHost.dart';
import 'package:mallflutterapp/net/BaseResponseEntity.dart';
import 'package:mallflutterapp/net/MallException.dart';
import 'package:mallflutterapp/net/RequestManager.dart';
import 'package:mallflutterapp/net/RequestMethodEnum.dart';
import 'package:mallflutterapp/net/RequestTypeEnum.dart';
import 'package:mallflutterapp/route/route.dart';

import 'CategoryInfoListRequestEntity.dart';
import 'CategoryInfoListRespEntity.dart';
import 'package:transparent_image/transparent_image.dart';

/// 微信精选
/// @author lizhid
/// @version V1.0.0
/// @date 2019/5/29
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

/// 微信精选State
/// @author lizhid
/// @version V1.0.0
/// @date 2019/5/29
class CategoryInfoListPageState extends State<CategoryInfoListPage> {
  dynamic option;

  /// 精选数据
  CategoryInfoListRespEntity _categoryInfoListRespEntity =
      new CategoryInfoListRespEntity();

  /// 滑动控制
  ScrollController _scrollController = new ScrollController();

  /// 正在加载 true:正在加载
  bool _isLoading = false;

  /// 条目数量
  int _itemCount = 0;

  /// 加载更改
  bool _hasMore = false;

  ///  页面条目数量
  int _pageSize = 20;

  /// 加载失败
  bool _loadFail = false;

  CategoryInfoListPageState(this.option) : super();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: Text("精选详情")),
        body: RefreshIndicator(
            child: ListView.builder(
                controller: _scrollController,
                itemCount: _itemCount + 1,
                itemBuilder: (context, index) {
                  if (_categoryInfoListRespEntity == null ||
                      _categoryInfoListRespEntity.xList == null) {
                    return null;
                  }
                  if (index == _itemCount) {
                    return _buildProgressIndicator();
                  }
                  return _crateItemWidget(
                      _categoryInfoListRespEntity.xList[index]);
                }),
            onRefresh: _onRefresh));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (_categoryInfoListRespEntity == null ||
            _categoryInfoListRespEntity.xList == null) {
          return;
        }
        CategoryInfoListRequestEntity param =
            new CategoryInfoListRequestEntity();
        param.cid = option.bundle['cid'];
        param.page = _categoryInfoListRespEntity.curPage + 1;
        param.size = _pageSize;
        _requestData(param, true);
      }
    });
    _onRefresh();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  /// 下拉刷新
  /// @return void
  /// @author lizhid
  /// @modify
  /// @date 2019/5/29 9:46
  Future _onRefresh() async {
    if (_categoryInfoListRespEntity != null) {
      _categoryInfoListRespEntity = null;
    }
    CategoryInfoListRequestEntity param = new CategoryInfoListRequestEntity();
    param.cid = option.bundle['cid'];
    param.page = 1;
    param.size = _pageSize;
    _requestData(param, false);
  }

  /// 创建条目
  /// @param data
  /// @return List<Widget>
  /// @author lizhid
  /// @modify
  /// @date 2019/5/29 9:42
  List<Widget> _createItem(CategoryInfoListRespEntity data) {
    List<Widget> listWidget = new List();
    if (data == null || data.xList == null) {
      listWidget.add(Text(""));
      return listWidget;
    }
    data.xList.forEach((CategoryInfoListRespEntityList result) {
      listWidget.add(_crateItemWidget(result));
    });
    return listWidget;
  }

  // 加载中的提示
  Widget _buildLoadText() {
    String msg = "数据没有更多了！！！";
    if(_loadFail){
      msg = "加载失败,请稍后重试！！！";
    }
    return Container(
        child: Padding(
      padding: const EdgeInsets.all(18.0),
      child: Center(
        child: Text(msg),
      ),
    ));
  }

// 上提加载loading的widget,如果数据到达极限，显示没有更多
  Widget _buildProgressIndicator() {
    if (_hasMore) {
      return new Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Center(
            child: Column(
          children: <Widget>[
            new Opacity(
              opacity: _isLoading ? 1.0 : 0.0,
              child: new CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.blue)),
            ),
            SizedBox(height: 20.0),
            Text(
              '稍等片刻更精彩...',
              style: TextStyle(fontSize: 14.0),
            )
          ],
        ) //child:
            ),
      );
    } else {
      return _buildLoadText();
    }
  }

  /// 创建列表视图
  /// @param result
  /// @return Widget
  /// @author lizhid
  /// @modify
  /// @date 2019/5/29 9:52
  Widget _crateItemWidget(CategoryInfoListRespEntityList result) {
    if (result == null) {
      return null;
    }
    return ListTile(
      title: Card(
          elevation: 4,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text("${result.title}",
                                style: TextStyle(fontSize: 15))),
                        Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text("${result.subTitle}",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey)))
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.all(10),
                      child: _imageLoad(result.thumbnails))
                ],
              )
            ],
          )),
      onTap: () {
        _onItemClick(result);
      },
    );
  }

  /// 设置加载失败默认图
  /// @param url
  /// @return Widget
  /// @author lizhid
  /// @modify
  /// @date 2019/5/30 9:54
  Widget _imageLoad(String url) {
    Widget image = _defaultImage();
    if (url == null || url.isEmpty) {
      return image;
    }
    image = FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: url, width: 100, height: 100, fit: BoxFit.cover);
    return image;
  }

  /// 默认图片
  /// @return Widget
  /// @author lizhid
  /// @modify
  /// @date 2019/5/30 10:52
  Widget _defaultImage() {
    return Image.asset("assets/images/defult_1.jpg",
        width: 100, height: 100, fit: BoxFit.cover);
  }

  /// 条目点击时间
  /// @param result
  /// @return void
  /// @author lizhid
  /// @modify
  /// @date 2019/5/29 15:35
  void _onItemClick(CategoryInfoListRespEntityList result) {
    if (result == null) {
      return;
    }
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      Map<String, dynamic> bundle = new Map();
      bundle['url'] = result.sourceUrl;
      bundle['title'] = result.title;
      return MallRoute.getPage(ViewConst.ROUTE_COMMON_WEBVIEWPAGE, bundle);
    }));
  }

  /// 请求微信精选分类
  /// @return
  /// @author lizhid
  /// @modify
  /// @date 2019/5/28 19:26
  void _requestData(CategoryInfoListRequestEntity param, bool loadMore) {
    if (param == null) {
      return;
    }

    /// 判断是否允许上拉
    if (loadMore) {
      if (!_isLoading) {
        setState(() {
          _isLoading = true;
          _loadFail = false;
        });
      } else {
        return;
      }
    }

    /// 请求类型
    RequestTypeEnum requestType =
        loadMore ? RequestTypeEnum.NET : RequestTypeEnum.CACHE_AND_NET;

    /// 请求数据
    RequestManager.httpRequest<CategoryInfoListRespEntity>(
        requestType, true, ApiHost.weChat_article_search,
        param: param, methodType: RequestMethodEnum.GET,
        successCallback: (BaseResponseEntity<CategoryInfoListRespEntity> data) {
      if (data == null) {
        return;
      }
      setState(() {
        if (!loadMore) {
          _categoryInfoListRespEntity = data.result;
        } else {
          _isLoading = false;
          _categoryInfoListRespEntity.curPage = data.result.curPage;
          _categoryInfoListRespEntity.xList.addAll(data.result.xList);
        }
        _itemCount = _categoryInfoListRespEntity.xList.length;
        _hasMore = _categoryInfoListRespEntity.curPage * _pageSize <
            _categoryInfoListRespEntity.total;
      });
    }, errorCallBack: (MallException e) {
      if (e != null) {
        setState(() {
          _isLoading = false;
          _hasMore = false;
          _loadFail = true;
        });
      }
    });
  }
}
