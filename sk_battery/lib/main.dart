import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


/*
* 某些原生的信息，如果没有很好的插件，我们可以通过platform channels（平台通道）来获取信息。
* 平台通过是如何工作的呢？
* 消息使用platform channels（平台通道）在客户端（UI）和宿主（平台）之间传递；
* 消息和响应以异步的形式进行传递，以确保用户界面能够保持响应；
*
* 调用过程大致如下：
* 1.客户端（Flutter端）发送与方法调用相对应的消息
* 2.平台端（iOS、Android端）接收方法，并返回结果；
* iOS端通过FlutterMethodChannel做出响应；
* Android端通过MethodChannel做出响应；
* */

/*
* 具体步骤
* 1.在Dart代码中，需要创建一个MethodChannel对象：
* 2.创建该对象时，需要传入一个name，该name是区分多个通信的名称
* 3.可以通过调用该对象的invokeMethod来给对应的平台发送消息进行通信
* 该调用是异步操作，需要通过await获取then回调来获取结果
* */

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue, splashColor: Colors.transparent
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
  //创建一个MethodChannel对象, 需要传入一个name, 该name是区分多个通信的名称
  static const platform = const MethodChannel("coderTao.com/battery");
  int _level = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("获取剩余电量"),
              onPressed: getBatteryInfo,
            ),
            Text("当前电量: $_level")
          ],
        ),
      ),
    );
  }

  void getBatteryInfo() async {
    //调用该对象的invokeMethod来给对应的平台发送消息进行通信
    final result = await platform.invokeMethod("getBatteryInfo");
    setState(() {
      _level = result;
    });
  }
}