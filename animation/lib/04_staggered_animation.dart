import 'package:flutter/material.dart';
//import 'dart:async';
import 'dart:math';

/// 四.交织动画
// 动画可以集合透明度变化、大小变化、颜色变化、旋转动画等；
// 我们这里是通过多个Tween生成了多个Animation对象；

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
  Animation _colorAnim;
  Animation _opacityAnim;
  Animation _radiansAnim;

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
    // 注意: animate() 可以传入 _controller 和 _animation ,但是有些动画_animation 不支持
    //3.1.创建size的tween
    _sizeAnim = Tween(begin: 10.0, end: 200.0).animate(_controller);
    //3.2.创建color的tween
    _colorAnim = ColorTween(begin: Colors.orange, end: Colors.purple).animate(_controller);
    // 3.3.创建opacity的tween
    _opacityAnim = Tween(begin: 0.0, end: 1.0).animate(_controller);
    // 3.4.创建radians的tween
    _radiansAnim = Tween(begin: 0.0, end: 2 * pi).animate(_controller);


    //4.监听动画状态改变
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
    /**
     * 1.大小变化动画
     * 2.颜色变化动画
     * 3.透明度变化动画
     */
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: Center(
        // 5.动画 更改size 的值
          child: AnimatedBuilder(
              animation: _controller,
              builder: (ctx, child){
                return Opacity(
                  opacity: _opacityAnim.value,
                  child: Transform(
                    transform: Matrix4.rotationZ(_radiansAnim.value),
                    alignment: Alignment.center,
                    child: Container(
                      width: _sizeAnim.value,
                      height: _sizeAnim.value,
                      color: _colorAnim.value,
                    ),
                  ),
                );
              })
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


