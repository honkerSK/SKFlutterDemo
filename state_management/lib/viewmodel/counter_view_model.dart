import 'package:flutter/material.dart';

//1.创建自己需要共享的数据(模型ViewModel extends ChangeNotifier 或者 with ChangeNotifier)
class SKCounterViewModel extends ChangeNotifier {
  int _counter = 110;

  int get counter => _counter;

  set counter(int value) {
    _counter = value;
    //通知所有监听者
    notifyListeners();
  }
}







