import 'package:flutter/material.dart';

import 'package:parsing_json_demo/services/student_services.dart';
import 'package:parsing_json_demo/services/address_services.dart';
import 'package:parsing_json_demo/services/shape_services.dart';
import 'package:parsing_json_demo/services/product_services.dart';
import 'package:parsing_json_demo/services/photo_services.dart';
import 'package:parsing_json_demo/services/page_services.dart';

import 'package:parsing_json_demo/services/user_services.dart';

void main() {
  runApp(MyApp());

  //1.简单的 map
//  loadStudent();

  //2.含有数组的简单结构
//  loadAddress();

  //3.简单的嵌套结构
//  loadShape();

  //4.含有 Lists 的嵌套结构
//  loadProduct();

  //5.map列表
//  loadPhotos();

  //6.复杂的嵌套结构
//  loadPage();

  //7.以json_serializable 的方式创建模型类
  loadUser();

}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo-codeTao',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            splashColor: Colors.transparent
        ),
        home:  MyHomePage()
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ParsingJson"),
      ),
      body: Text("页面内容" , style: TextStyle(fontSize: 20, color: Colors.red)),
    );
  }
}


