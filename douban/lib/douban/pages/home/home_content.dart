import 'package:flutter/material.dart';

class SKHomeContent extends StatefulWidget {
  @override
  _SKHomeContentState createState() => _SKHomeContentState();
}

class _SKHomeContentState extends State<SKHomeContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("首页内容", style: TextStyle(fontSize: 30, color: Colors.green),),
    );
  }
}


