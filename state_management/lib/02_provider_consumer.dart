import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/viewmodel/counter_view_model.dart';

/// Provider使用步骤:
/// 1.创建自己需要共享的数据 (模型ViewModel extends ChangeNotifier 或者 with ChangeNotifier)
/// 2.在应用程序的顶层ChangeNotifierProvider
/// 3.在其它位置使用共享的数据
///  > Provider.of: 当Provider中的数据发生改变时, Provider.of所在的Widget整个build方法都会重新构建
///  > Consumer(相对推荐): 当Provider中的数据发生改变时, 只会重新执行Consumer的builder
///  > Selector: 1.selector方法(作用,对原有的数据进行转换) 2.shouldRebuild(作用,要不要重新构建)


void main() {
  runApp(
    //2.在应用程序的顶层ChangeNotifierProvider
      ChangeNotifierProvider(
        create: (ctx) => SKCounterViewModel(),
        child: MyApp(),
      )
  );
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
    // Provider.of 取出模型SKCounterViewModel数据
//    int counter = Provider.of<SKCounterViewModel>(context).counter;

    return Scaffold(
        appBar: AppBar(
          title: Text('Provider Consumer'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SKShowData01(),
              SKShowData02()
            ],
          ),
        ),

        //4.Consumer 修改模型数据, 通过泛型告诉要消费哪一个
        floatingActionButton: Consumer<SKCounterViewModel>(
            builder:(ctx, counterViewModel, child){
              print("floatingActionButton build方法被执行");
              return FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: (){
                  counterViewModel.counter++;
                },
              );
            }
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


