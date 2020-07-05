import 'package:flutter/material.dart';
import 'package:flutter_liftcycle_demo/pages/test_stateful_widget.dart';
import 'package:flutter_liftcycle_demo/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, splashColor: Colors.transparent),
      home: Scaffold(
          appBar: AppBar(
            title: Text('首页'), // 页面名字
          ),
          body: Center(
            child:
            //TestStatefulWidget(),
            HomePage()
          )
      ),
    );
  }
}


