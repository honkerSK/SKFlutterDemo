import 'package:flutter/material.dart';

import 'detail.dart';
import 'about.dart';
import 'unknown.dart';

// 二. 命名路由使用
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
      routes: { //配置映射关系
//        '/': (ctx) => SKHomePage(), //配置后可以使用initialRoute 代替home属性
//        '/about': (ctx) => SKAboutPage(),
        SKHomePage.routerName: (ctx) => SKHomePage(),
        SKAboutPage.routerName: (ctx) => SKAboutPage(),
      },
//      home: SKHomePage(),
      initialRoute: '/',

      //钩子函数
      onGenerateRoute: (settings){
        if (settings.name == SKDetailPage.routerName){
          return MaterialPageRoute(
            builder: (ctx){
              return SKDetailPage(settings.arguments);
            }
          );
        }
        return null;
      },

      //错误信息钩子函数
      onUnknownRoute: (settings){
        return MaterialPageRoute(
          builder: (ctx){
            return SKUnknownPage();
          }
        );
      },

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

  //2 命名路由使用 通过 arguments 传递参数
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

  //3 钩子函数跳转
  void _jumpToDetail2(BuildContext context){
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

  //3 跳转不存在路径
  void _jumpToSetting(BuildContext context){
    Future result = Navigator.of(context).pushNamed('/aaaa');

  }

}
