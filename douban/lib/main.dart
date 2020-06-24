import 'package:flutter/material.dart';

import './douban/pages/main/sk_main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'douBanDemo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent
      ),
      home:SKMainPage()
    );
  }
}

