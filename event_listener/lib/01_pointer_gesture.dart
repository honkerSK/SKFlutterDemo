import 'package:flutter/material.dart';

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
        child: NestedWidgetGestureDemo(),
      ),
    );
  }
}

//3.Stack叠加widget 响应不同手势
class NestedWidgetGestureDemo extends StatelessWidget {
  const NestedWidgetGestureDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        GestureDetector(
          onTapDown: (details) {
            print("outer click");
          },
          child: Container(
            width: 200,
            height: 200,
            color: Colors.yellow,
            alignment: Alignment.center,
          ),
        ),
        IgnorePointer(  //IgnorePointer 作用:忽略嵌套GestureDetector中手势
          child: GestureDetector(
            onTapDown: (details) {
              print("inner click");
            },
            child: Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
          ),
        )
      ],
    );
  }
}

//3.




//2.手势
class GestureDemo extends StatelessWidget {
  const GestureDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTapDown: (details) {
          print("手指按下");
          print(details.globalPosition);
          print(details.localPosition);
        },
        onTapUp: (details) {
          print("手指抬起");
        },
        onTapCancel: () {
          print("手势取消");
        },
        onTap: () {
          print("手势点击");
        },
        onDoubleTap: () {
          print("手指双击");
        },
        onLongPress: () {
          print("长按手势");
        },
        child: Container(
          width: 200,
          height: 200,
          color: Colors.orange,
        ),
      ),
    );
  }
}


//1.原始指针
class ListenerDemo extends StatelessWidget {
  const ListenerDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (event) {
        print("指针按下:$event");
        print(event.position);
        print(event.localPosition);
      },
      onPointerMove: (event) {
//            print("指针移动:$event");
      },
      onPointerUp: (event) {
//            print("指针抬起:$event");
      },
      child: Container(
        width: 200,
        height: 200,
        color: Colors.red,
      ),
    );
  }
}






