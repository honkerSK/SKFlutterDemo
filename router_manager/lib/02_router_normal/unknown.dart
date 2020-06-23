import 'package:flutter/material.dart';
// 四 跳转不存在路径, 错误页
class SKUnknownPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("错误页面"),
      ),
      body: Center(
        child: Text('错误页面', style: TextStyle(fontSize: 20, color: Colors.red),),
      ),
    );
  }
}
