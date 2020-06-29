
import 'package:flutter/material.dart';
import 'initializa_items.dart';

class SKMainPage extends StatefulWidget {
  @override
  _SKMainPageState createState() => _SKMainPageState();
}

class _SKMainPageState extends State<SKMainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: items,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        type: BottomNavigationBarType.fixed, //不设置没有文字显示
        onTap: (index){
            setState(() {
              _currentIndex = index;
            });

        },
      ),


    );
  }

}

