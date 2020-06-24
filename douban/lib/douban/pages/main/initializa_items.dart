
import 'package:flutter/material.dart';
import 'bottom_bar_item.dart';
import '../home/home.dart';
import '../subject/subject.dart';

List<SKBottomBarItem> items = [
  SKBottomBarItem("home", "首页"),
  SKBottomBarItem("subject", "书影音"),
  SKBottomBarItem("group", "小组"),
  SKBottomBarItem("mall", "市集"),
  SKBottomBarItem("profile", "我的"),
];

List<Widget> pages = [
  SKHomePage(),
  SKSubject(),
  SKHomePage(),
  SKHomePage(),
  SKHomePage(),
];
