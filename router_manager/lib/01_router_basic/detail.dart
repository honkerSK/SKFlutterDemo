import 'package:flutter/material.dart';

// 一.普通路由使用
class SKDetailPage extends StatelessWidget {

  final String _message;
  SKDetailPage(this._message);

  @override
  Widget build(BuildContext context) {

    //解决返回数据时 点击返回按钮崩溃方法二: WillPopScope 可以监听返回按钮返回
    return WillPopScope(
      // 当返回为true时,可以自动返回(flutter帮助我们执行返回操作)
      // 当返回为false时, 自行写返回代码
      onWillPop: (){
        _backToHome(context);
        return Future.value(false);
      },

      child: Scaffold(
          appBar: AppBar(
            title: Text('详情页', style: TextStyle(fontSize: 20, color: Colors.white),),
            //解决返回数据时 点击返回按钮崩溃方法一: leading
//        leading: IconButton(
//          icon: Icon(Icons.arrow_back_ios),
//          onPressed: () => _backToHome(context),
//        ),

          ),
          body:Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(_message, style: TextStyle(fontSize: 20, color: Colors.orange),),
                RaisedButton(
                  child: Text('返回首页'),
                  onPressed: ()=> _backToHome(context),
                )
              ],
            ),
          )
      ),
    );
  }

  //2.普通跳转方式 返回首页 (传递)
  void _backToHome(BuildContext context){
    Navigator.of(context).pop("详情返回数据:fromDetailData");
  }

}

