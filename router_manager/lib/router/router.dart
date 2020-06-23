import 'package:flutter/material.dart';

import '../main.dart';
import '../detail.dart';
import '../about.dart';
import '../unknown.dart';


class SKRouter{
  static final Map<String, WidgetBuilder> routes = {
    SKHomePage.routerName: (ctx) => SKHomePage(),
    SKAboutPage.routerName: (ctx) => SKAboutPage(),
  };

  static final String initialRoute = SKHomePage.routerName;

  //钩子函数有一个参数RouteSettings，该类有两个常用的属性：
  //name: 跳转的路径名称
  //arguments：跳转时携带的参数
  static final RouteFactory generateRoute = (settings){
    if (settings.name == SKDetailPage.routerName){
      return MaterialPageRoute(
          builder: (ctx){
            return SKDetailPage(settings.arguments);
          }
      );
    }
    return null;
  };

  static final RouteFactory unknownRoute = (settings){
    return MaterialPageRoute(
        builder: (ctx){
          return SKUnknownPage();
        }
    );
  };

}
