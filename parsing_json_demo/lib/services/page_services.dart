import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:parsing_json_demo/model/page_model.dart';

Future<String> _loadPageAsset() async {
  return await rootBundle.loadString('assets/page.json');
}


Future loadPage() async {
  String jsonPage = await _loadPageAsset();
  final jsonResponse = json.decode(jsonPage);
  Page page = new Page.fromJson(jsonResponse);
  print("imageName: " + page.data[0].imagesList[0].imageName);
}