import 'package:flutter/material.dart';
//import 'dart:async';

///  1.Animation: 抽象类
///    * 监听动画值的改变
///    * 监听动画状态的改变
///    * value
///    * status
///  2.AnimationController继承自Animation
///    * vsync: 同步信号(this -> with SingleTickerProviderStateMixin)
///    * forward(): 向前执行动画
///    * reverse(): 反转执行动画
///  3.CurvedAnimation:
///    * 作用: 设置动画执行的速率(速度曲线)
///  4.Tween: 设置动画执行的value范围
///    * begin: 开始值
///    * end: 结束值


/// 二.AnimatedWidget

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'animation',
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

class _SKHomePageState extends State<SKHomePage> with SingleTickerProviderStateMixin {
  // 创建AnimationController
  AnimationController _controller;
  Animation _animation;
  Animation _sizeAnim;

  @override
  void initState() {
    super.initState();

    //1.创建AnimationController
    _controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 2)
    );
    //2.设置Curve的值
    _animation = CurvedAnimation(parent:  _controller, curve: Curves.linear);
    //3.Tween
    _sizeAnim = Tween(begin: 50.0, end: 150.0).animate(_animation);

    //监听动画值的改变
//    _controller.addListener(() {
//      setState(() {});
//    });

    //监听动画状态改变
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed){
        _controller.reverse();
      }else if(status == AnimationStatus.dismissed){
        _controller.forward();
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: Center(
        //动画 更改size 的值
          child: SKAnimatedIcon(_sizeAnim)
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: (){
          if(_controller.isAnimating){
            _controller.stop();
          }else if(_controller.status == AnimationStatus.forward){
            _controller.forward();
          }else if(_controller.status == AnimationStatus.reverse){
            _controller.reverse();
          }else {
            _controller.forward();
          }

        },
      ),
    );
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

}


//在 01_animation_basic 代码中，我们必须监听动画值的改变，并且改变后需要调用setState，这会带来两个问题：
//1.执行动画必须包含被部分代码，代码比较冗余
//2.调用setState意味着整个State类中的build方法就会被重新build

//进一步优化上面的操作->AnimatedWidget
//创建一个Widget继承自AnimatedWidget

class SKAnimatedIcon extends AnimatedWidget {
  SKAnimatedIcon(Animation anim): super(listenable: anim);

  @override
  Widget build(BuildContext context) {
    Animation anim = listenable;
    return Icon(Icons.favorite, color: Colors.red, size: anim.value,);
  }
}



