import 'package:flutter/material.dart';

import 'detail.dart';
import 'about.dart';
//import 'unknown.dart';
import 'router/router.dart';


// 三. 封装router使用
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

      routes: SKRouter.routes,
      initialRoute: SKRouter.initialRoute,
      //钩子函数
      onGenerateRoute: SKRouter.generateRoute,
      //错误信息钩子函数
      onUnknownRoute: SKRouter.unknownRoute,

    );
  }
}

class SKHomePage extends StatefulWidget {
  static const String routerName = '/';

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
              child: Text('跳转到详情'),
              onPressed: () => _jumpToDetail(context),
            ),
            RaisedButton(
              child: Text('跳转到关于'),
              onPressed: () => _jumpToAbout(context),
            ),
            RaisedButton(
              child: Text('跳转到详情2'),
              onPressed: () => _jumpToDetail2(context),
            ),
            RaisedButton(
              child: Text('跳转不存在路由'),
              onPressed: () => _jumpToSetting(context),
            )
          ],
        ),
      ),
    );
  }

  //1.普通路由使用
  void _jumpToDetail(BuildContext context) {
     Future result = Navigator.of(context).push(MaterialPageRoute(
        builder: (context){
          return SKDetailPage("首页传递数据 formHomeData");
        })
      );
     //Future接收返回数据
     result.then((res) {
       setState(() {
         _homeMessage = res;
       });
     });
  }

  //2.命名路由使用 通过 arguments 传递参数
  void _jumpToAbout(BuildContext context){
    Future result = Navigator.of(context).pushNamed(
        SKAboutPage.routerName,
        arguments: "命名路由 formHomeToAbout"
    );
    //Future接收返回数据
    result.then((res) => {
      setState((){
        _homeMessage = res;
      })
    });
  }

  //3.钩子函数跳转
  void _jumpToDetail2(BuildContext context){
    //当我们通过pushNamed进行跳转，但是对应的name没有在routes中有映射关系，那么就会执行onGenerateRoute钩子函数；
    Future result = Navigator.of(context).pushNamed(
        SKDetailPage.routerName ,
        arguments: '钩子函数 formHomeToDetail 33');
    //Future接收返回数据
    result.then((res) => {
      setState((){
        _homeMessage = res;
      })
    });
  }

  //3.钩子函数 跳转不存在路径
  void _jumpToSetting(BuildContext context){
    Future result = Navigator.of(context).pushNamed('/aaaa');
  }

}
