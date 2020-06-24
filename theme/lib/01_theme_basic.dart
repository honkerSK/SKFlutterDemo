import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /**
     * 1.一旦设置了主题, 那么应用程序中的某些Widget, 就会直接使用主题的样式
     * 2.可以通过Theme.of(context).textTheme.display2
     */

    // MaterialColor extends Color
    // 父类的引用指向一个子类的对象
//    Color color = Colors.orangeAccent;

    // 子类的引用指向父类的对象;
    // MaterialColor color = Color(0xff000000);

    return MaterialApp(
      title: 'Flutter Demo',
      // 全局主题
      theme: ThemeData(
        // 1.亮度
          brightness: Brightness.light,
          // 2.primarySwatch传入不是Color, 而是MaterialColor(包含了primaryColor和accentColor)
          primarySwatch: Colors.red,
          // 3.primaryColor: 单独设置导航和TabBar的颜色
          primaryColor: Colors.orange,
          // 4.accentColor: 单独设置FloatingActionButton\Switch
          accentColor: Colors.green,
          // 5.Button的主题
          buttonTheme: ButtonThemeData(
              height: 25,
              minWidth: 10,
              buttonColor: Colors.yellow
          ),
          // 6.Card的主题
          cardTheme: CardTheme(
              color: Colors.greenAccent,
              elevation: 10
          ),
          // 7.Text的主题
          textTheme: TextTheme(
            bodyText2: TextStyle(fontSize: 16, color: Colors.red),
            bodyText1: TextStyle(fontSize: 20),

            headline4: TextStyle(fontSize: 14),
            headline3: TextStyle(fontSize: 16),
            headline2: TextStyle(fontSize: 18),
            headline1: TextStyle(fontSize: 20),
          )
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
          title: Text("首页")
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("Hello World"),
            Text("Hello World", style: TextStyle(fontSize: 14),),
            Text("Hello World", style: TextStyle(fontSize: 20),),
            Text("Hello World", style: Theme.of(context).textTheme.bodyText1,),
            Text("Hello World", style: Theme.of(context).textTheme.headline2,),
            Switch(value: true, onChanged: (value) {},),
            CupertinoSwitch(value: true, onChanged: (value) {}, activeColor: Colors.red,),
            RaisedButton(child: Text("R"), onPressed: () {},),
            Card(child: Text("主题配置", style: TextStyle(fontSize: 50),),)
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              title: Text("首页"),
              icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
              title: Text("分类"),
              icon: Icon(Icons.category)
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx) {
                return SKDetailPage();
              }
          ));
        },
      ),
    );
  }
}


class SKDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //局部主题配置
    return Theme(
      data: Theme.of(context).copyWith(
          primaryColor: Colors.purple
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("详情页"),
          backgroundColor: Colors.purple,
        ),
        body: Center(
          child: Text("detail pgae"),
        ),
        //FloatingActionButton 主题配置
        floatingActionButton: Theme(
          data: Theme.of(context).copyWith(
              colorScheme: Theme.of(context).colorScheme.copyWith(
                  secondary: Colors.pink
              )
          ),
          child: FloatingActionButton(
            child: Icon(Icons.pets),
            onPressed: () {
            },
          ),
        ),
      ),
    );
  }
}

