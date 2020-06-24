


import 'package:flutter/material.dart';

import 'pages/model_page.dart';
import 'pages/image_detail.dart';

// 五. model转场动画

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'animation',
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
        title: Text('首页', style: TextStyle(fontSize: 20, color: Colors.white),),
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 16/9
        ),
        children: List.generate(20, (index) {
          final imageUrl = 'https://picsum.photos/500/500?random=$index';
          return GestureDetector(
            onTap: (){
              Navigator.of(context).push(PageRouteBuilder(
                  pageBuilder: (ctx , animation, animation2){
                    return FadeTransition(opacity: animation, child: SKImageDetailPage(imageUrl),);
                  }
              ));
            },
            child: Image.network(imageUrl, fit: BoxFit.cover,),
          );
        }),

      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.input),
        onPressed: (){

          // iOS-> Model方式弹出
//          Navigator.of(context).push(MaterialPageRoute(
//            builder: (ctx){
//             return SKModelPage();
//            },
//            fullscreenDialog: true //fullscreenDialog 为true, Model方式弹出
//          ));

          // 其他弹出方式 : 淡入淡出效果
          Navigator.of(context).push(PageRouteBuilder(
              transitionDuration: Duration(seconds: 3),
              pageBuilder: (ctx, animation, animation2){
                return FadeTransition(
                  opacity: animation, //动画
                  child: SKModelPage(),
                );
              }
          ));

        },
      ),
    );
  }
}



