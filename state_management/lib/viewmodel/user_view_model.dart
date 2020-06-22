
import 'package:flutter/material.dart';
import 'package:state_management/model/user_info.dart';

class SKUserViewModel extends ChangeNotifier {
  UserInfo _user;
  SKUserViewModel(this._user);

  UserInfo get user => _user;

  set user(UserInfo value) {
    _user = value;
    notifyListeners();
  }
}