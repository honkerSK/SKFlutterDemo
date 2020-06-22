import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:state_management/viewmodel/initialize_providers.dart';
import 'package:state_management/viewmodel/counter_view_model.dart';
import 'package:state_management/viewmodel/user_view_model.dart';

/// Provider使用步骤:
/// 1.创建自己需要共享的数据 (模型ViewModel extends ChangeNotifier 或者 with ChangeNotifier)
/// 2.在应用程序的顶层ChangeNotifierProvider
/// 3.在其它位置使用共享的数据
///  > Provider.of: 当Provider中的数据发生改变时, Provider.of所在的Widget整个build方法都会重新构建
///  > Consumer(相对推荐): 当Provider中的数据发生改变时, 只会重新执行Consumer的builder  (属性child用于不需要反复build的Widge)
///  > Selector:
///  参数:1.selector方法(作用,对原有的数据进行转换 A可以转换为S) 2.shouldRebuild(作用,要不要重新构建) 3.builder 拿到S类型

//多个Provider
void main() {
  runApp(
    //2.在应用程序的顶层ChangeNotifierProvider
      MultiProvider(
        providers: providers,
        child: MyApp(),
      )
  );


//  runApp(
//    // 2.在应用程序的顶层ChangeNotifierProvider
//    ChangeNotifierProvider(
//      create: (ctx) => HYCounterViewModel(),
//      child: ChangeNotifierProvider(
//        create: (ctx) => HYUserViewModel(userInfo),
//        child: MyApp(),
//      ),
//    )
//  );

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FlutterDemo",
      theme: ThemeData(
          primarySwatch: Colors.blue, splashColor: Colors.transparent
      ),
      home: SKHomePage(),
    );
  }
}



class SKHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('Multi Provider'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SKShowData01(),
              SKShowData02(),
              SKShowData03()
            ],
          ),
        ),

        //4.Consumer 修改模型数据, 通过泛型告诉要消费哪一个
        floatingActionButton: Selector<SKCounterViewModel, SKCounterViewModel>(
          selector: (ctx, counterViewModel) => counterViewModel,  //传入A 返回S
          shouldRebuild: (prev, next) => false,  // false 不在重新构建
          builder:(ctx, counterViewModel, child){  //builder 中 S类型
            print("floatingActionButton build方法被执行");
            //这里floatingActionButton和里面Icon 没有数据展示,不需要重新构建!
            return FloatingActionButton(
              child: child,  //代指 Icon(Icons.add)
              onPressed: (){
                counterViewModel.counter++;
              },
            );
          },
          child: Icon(Icons.add),  //每次调用,不会再重新构建Icon
        )
    );
  }
}


class SKShowData01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //3.在其它位置使用共享的数据
    // Provider.of<> 泛型指定依赖类型
    int counter = Provider.of<SKCounterViewModel>(context).counter;
    print("data01的build方法");

    return Container(
      color: Colors.red,
      child: Text("当前计数:$counter", style: TextStyle(fontSize: 30) ),
    );
  }
}


class SKShowData02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    print("data02的build方法");
    //3.在其它位置使用共享的数据
    // Consumer 获取模型数据
    return Container(
      color: Colors.blue,
      child: Consumer<SKCounterViewModel>(
        builder: (ctx, counterViewModel, child){
          print("data02 Consumer build方法被执行");
          return Text("当前计数:${counterViewModel.counter}", style: TextStyle(fontSize: 30) );
        },
      ),
    );
  }
}


class SKShowData03 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //3.在其它位置使用共享的数据
    // Consumer 获取模型数据
    return Container(
      color: Colors.orange,
      // Provider.of, Consumer, Selector, Consumer2
      child: Consumer2<SKCounterViewModel, SKUserViewModel>(   //注意:泛型A B 和 builder返回A B 一致
        builder: (ctx, counterViewModel, userVM, child){
          return Text(
              "当前计数:${counterViewModel.counter} nickname:${userVM.user.nickname}",
              style: TextStyle(fontSize: 20)
          );
        },
      ),
    );
  }
}