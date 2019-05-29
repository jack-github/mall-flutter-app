// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// RouteWriterGenerator
// **************************************************************************

import 'dart:convert';
import 'package:annotation_route/route.dart';
import 'package:mallflutterapp/biz/category/CategoryPage.dart';
import 'package:mallflutterapp/biz/special/SpecialPage.dart';
import 'package:mallflutterapp/biz/account/AccountPage.dart';
import 'package:mallflutterapp/biz/common/WebViewPage.dart';
import 'package:mallflutterapp/biz/category/CategoryInfoListPage.dart';
import 'package:mallflutterapp/biz/common/SplashPage.dart';
import 'package:mallflutterapp/test2.dart';
import 'package:mallflutterapp/biz/home/HomePage.dart';
import 'package:mallflutterapp/biz/common/AppRootPage.dart';
import 'package:mallflutterapp/test.dart';

class ARouterInternalImpl extends ARouterInternal {
  ARouterInternalImpl();
  final Map<String, List<Map<String, dynamic>>> innerRouterMap =
      <String, List<Map<String, dynamic>>>{
    'page//category/categoryPage': [
      {'clazz': CategoryPage}
    ],
    'page//special/specialPage': [
      {'clazz': SpecialPage}
    ],
    'page//account/accountPage': [
      {'clazz': AccountPage}
    ],
    'page//common/webViewPage': [
      {'clazz': WebViewPage}
    ],
    'page//category/categoryPageList': [
      {'clazz': CategoryInfoListPage}
    ],
    'page//common/splashPage': [
      {'clazz': SplashPage}
    ],
    'page//test2': [
      {'clazz': MyButton}
    ],
    'page//home/homePage': [
      {'clazz': HomePage}
    ],
    'page//common/appRootPage': [
      {'clazz': AppRootPage}
    ],
    'page//test': [
      {'clazz': RandomWords}
    ]
  };

  @override
  bool hasPageConfig(ARouteOption option) {
    final dynamic pageConfig = findPageConfig(option);
    return pageConfig != null;
  }

  @override
  ARouterResult findPage(ARouteOption option, dynamic initOption) {
    final dynamic pageConfig = findPageConfig(option);
    if (pageConfig != null) {
      return implFromPageConfig(pageConfig, initOption);
    } else {
      return ARouterResult(state: ARouterResultState.NOT_FOUND);
    }
  }

  void instanceCreated(
      dynamic clazzInstance, Map<String, dynamic> pageConfig) {}

  dynamic instanceFromClazz(Type clazz, dynamic option) {
    switch (clazz) {
      case CategoryPage:
        return new CategoryPage(option);
      case SpecialPage:
        return new SpecialPage(option);
      case AccountPage:
        return new AccountPage(option);
      case WebViewPage:
        return new WebViewPage(option);
      case CategoryInfoListPage:
        return new CategoryInfoListPage(option);
      case SplashPage:
        return new SplashPage(option);
      case MyButton:
        return new MyButton(option);
      case HomePage:
        return new HomePage(option);
      case AppRootPage:
        return new AppRootPage(option);
      case RandomWords:
        return new RandomWords(option);
      default:
        return null;
    }
  }

  ARouterResult implFromPageConfig(
      Map<String, dynamic> pageConfig, dynamic option) {
    final String interceptor = pageConfig['interceptor'];
    if (interceptor != null) {
      return ARouterResult(
          state: ARouterResultState.REDIRECT, interceptor: interceptor);
    }
    final Type clazz = pageConfig['clazz'];
    if (clazz == null) {
      return ARouterResult(state: ARouterResultState.NOT_FOUND);
    }
    try {
      final dynamic clazzInstance = instanceFromClazz(clazz, option);
      instanceCreated(clazzInstance, pageConfig);
      return ARouterResult(
          widget: clazzInstance, state: ARouterResultState.FOUND);
    } catch (e) {
      return ARouterResult(state: ARouterResultState.NOT_FOUND);
    }
  }

  dynamic findPageConfig(ARouteOption option) {
    final List<Map<String, dynamic>> pageConfigList =
        innerRouterMap[option.urlpattern];
    if (null != pageConfigList) {
      for (int i = 0; i < pageConfigList.length; i++) {
        final Map<String, dynamic> pageConfig = pageConfigList[i];
        final String paramsString = pageConfig['params'];
        if (null != paramsString) {
          Map<String, dynamic> params;
          try {
            params = json.decode(paramsString);
          } catch (e) {
            print('not found A{pageConfig};');
          }
          if (null != params) {
            bool match = true;
            final Function matchParams = (String k, dynamic v) {
              if (params[k] != option?.params[k]) {
                match = false;
                print('not match:A{params[k]}:A{option?.params[k]}');
              }
            };
            params.forEach(matchParams);
            if (match) {
              return pageConfig;
            }
          } else {
            print('ERROR: in parsing paramsA{pageConfig}');
          }
        } else {
          return pageConfig;
        }
      }
    }
    return null;
  }
}
