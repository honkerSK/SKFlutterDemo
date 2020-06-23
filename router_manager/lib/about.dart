import 'package:flutter/material.dart';

// 二. 命名路由使用

class SKAboutPage extends StatelessWidget {
  static const String routerName = '/about';

  @override
  Widget build(BuildContext context) {
    //命名路由 获取arguments 传递数据
    final String message = ModalRoute.of(context).settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text("关于页"),
       // 解决返回数据时 点击返回按钮崩溃方法一: leading
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => _backToHome(context),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(message),
            RaisedButton(
              child: Text('返回首页'),
              onPressed: () => _backToHome(context),
            )
          ],
        ),
      ),
    );
  }
  //返回数据
  void _backToHome(BuildContext context){
    Navigator.of(context).pop("关于返回数据:formAbout");
  }

}

