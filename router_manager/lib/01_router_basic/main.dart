
import 'package:flutter/material.dart';
import 'detail.dart';

// 一.普通路由使用
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'router manager',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          splashColor: Colors.transparent
      ),
      home: SKHomePage(),
    );
  }
}

class SKHomePage extends StatefulWidget {
  @override
  _SKHomePageState createState() => _SKHomePageState();
}

class _SKHomePageState extends State<SKHomePage> {
  String _homeMessage = 'default message';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('首页', style: TextStyle(fontSize: 20 ,color: Colors.white),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_homeMessage, style: TextStyle(fontSize: 20),),
            RaisedButton(
              child: Text('跳转到详情页'),
              onPressed: () => _jumpToDetail(context),
            )
          ],
        ),
      ),
    );
  }

  //普通跳转方式
  void _jumpToDetail(BuildContext context) {
    Future result = Navigator.of(context).push(MaterialPageRoute(
        builder: (context){
          return SKDetailPage("普通路由 formHomeToDetail");
        })
    );
    //Future接收返回数据
    result.then((res) {
      setState(() {
        _homeMessage = res;
      });
    });
  }
}
