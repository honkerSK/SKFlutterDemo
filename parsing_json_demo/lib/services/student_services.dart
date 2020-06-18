import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:parsing_json_demo/model/student_model.dart';

//加载 Json Asset
Future<String> _loadAStudentAsset() async {
  return await rootBundle.loadString('assets/student.json');
}

//加载响应
Future loadStudent() async {
  //从 assets 中加载原始 json 字符串
  String jsonString = await _loadAStudentAsset();
  //解码我们得到的 json 字符串
  final jsonResponse = json.decode(jsonString);
  //通过调用 Student.fromJson 方法反序列化解码的 json 响应，以便可以使用 Student 对象来访问我们的实体
  Student student = new Student.fromJson(jsonResponse);
  //Student 类里打印了 studentScores
  print("student.studentScores= ${student.studentScores}");
}