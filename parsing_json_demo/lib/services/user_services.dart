import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:parsing_json_demo/model2/user_model.dart';

//加载 Json Asset
Future<String> _loadAUserAsset() async {
  return await rootBundle.loadString('assets/user.json');
}

//加载响应
Future loadUser() async {
  //从 assets 中加载原始 json 字符串
  String jsonString = await _loadAUserAsset();
  //解码我们得到的 json 字符串
  final jsonResponse = json.decode(jsonString);
  //通过调用 User.fromJson 方法反序列化解码的 json 响应，以便可以使用 User 对象来访问我们的实体
  User user = new User.fromJson(jsonResponse);
  //打印
  print(user);
  print(user.computer);
}