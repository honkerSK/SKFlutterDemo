
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'counter_view_model.dart';
import 'user_view_model.dart';
import 'package:state_management/model/user_info.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (ctx) => SKCounterViewModel(),),
  ChangeNotifierProvider(create: (ctx) => SKUserViewModel(UserInfo("tao", 18, "http://xxxx")),),
];
