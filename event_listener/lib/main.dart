import 'package:flutter/material.dart';
import 'package:event_bus/event_bus.dart';

// 使用event_bus 多层组件事件传递

// 1.创建全局的EventBus对象
final eventBus = EventBus();

class UserInfo{
  String nickname;
  int level;

  UserInfo(this.nickname, this.level);
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "事件监听",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        splashColor: Colors.transparent
      ),
      home: SKHomePage(),
    );
  }
}

class SKHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("事件监听", style: TextStyle(fontSize: 20, color: Colors.white),),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SKButton(),
              SKText()
            ],
          ),
      ),
    );
  }
}


class SKButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('按钮'),
      onPressed: (){
        //2.发出事件
        final info = UserInfo('codeTao', 18);
        eventBus.fire(info);
      },
    );
  }
}


class SKText extends StatefulWidget {
  @override
  _SKTextState createState() => _SKTextState();
}

class _SKTextState extends State<SKText> {
  String _message = 'Hello Flutter';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //3.initState中监听事件的类型
    eventBus.on<UserInfo>().listen((event) {
      print(event.nickname);
      print(event.level);
      setState(() {
        _message = '${event.nickname}-${event.level}';
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Text(_message, style: TextStyle(fontSize: 20),);
  }

}




