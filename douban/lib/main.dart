import 'package:douban/douban/pages/main/scaffold_route.dart';
import 'package:flutter/material.dart';

import './douban/pages/main/sk_main.dart';
import './douban/pages/main/scaffold_route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'douBanDemo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent
      ),
      //常规tabbar
      home:SKMainPage()
//      home: ScaffoldRoute(), //带分类和侧边栏tabbar
    );
  }
}

