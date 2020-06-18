import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:parsing_json_demo/model/shape_model.dart';


Future<String> _loadShapeAsset() async {
  return await rootBundle.loadString('assets/shape.json');
}


Future loadShape() async {
  String jsonString = await _loadShapeAsset();
  final jsonResponse = json.decode(jsonString);
  Shape shape = new Shape.fromJson(jsonResponse);
  print("shape.property.height= ${shape.property.height}");
}