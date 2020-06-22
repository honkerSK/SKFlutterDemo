import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class SKCounterWidget extends InheritedWidget{
  //1.共享数据
  final int counter;

  //2.定义构造方法
  SKCounterWidget({this.counter, Widget child}) : super(child:child);

  //3.获取组件最近的当前InheritedWidget对象
  static SKCounterWidget of(BuildContext context){
    //沿着Element树, 去找到最近的HYCounterElement, 从Element中取出Widget对象
    // (这里找到_SKHomePageState中SKCounterWidget)
    return context.dependOnInheritedWidgetOfExactType();
  }

  // 4.绝定要不要回调State中的didChangeDependencies
  // 如果返回true: 执行依赖当期的InheritedWidget的State中的didChangeDependencies
  @override
  bool updateShouldNotify(SKCounterWidget oldWidget) {
    // TODO: implement updateShouldNotify
//    throw UnimplementedError();
    return oldWidget.counter != counter;
  }

}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FlutterDemo",
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
  int _counter = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("InheritedWidget"),
      ),
      // 5.找到需要共享数据Widget的父类,添加共享数据模型的实例
      body: SKCounterWidget(
        counter: _counter, //传入初始值
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SKShowData01(),
                SKShowData02()
              ],
            )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          setState(() {
            _counter++;
          });
        },
      ),
    );
  }
}


class SKShowData01 extends StatefulWidget {
  @override
  _SKShowData01State createState() => _SKShowData01State();
}

class _SKShowData01State extends State<SKShowData01> {

  @override
  Widget build(BuildContext context) {
    //6.取出共享数据, 调用共享模型of方法传入context
    int counter = SKCounterWidget.of(context).counter;

    return Card(
      color: Colors.red,
      child: Text("当前计数:$counter", style: TextStyle(fontSize: 30) ),
    );
  }

  //7.如果需要监听事件 ,重写didChangeDependencies()
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("执行了_SKShowData01State中didChangeDependencies");
  }

}



class SKShowData02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //6.取出共享数据, 调用共享模型of方法传入context
    int counter = SKCounterWidget.of(context).counter;

    return Container(
      color: Colors.blue,
      child: Text("当前计数:$counter", style: TextStyle(fontSize: 30) ),
    );
  }
}


