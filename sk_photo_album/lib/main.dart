import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, splashColor: Colors.transparent),
      home: SKHomePage(),
    );
  }
}

class SKHomePage extends StatefulWidget {
  @override
  _SKHomePageState createState() => _SKHomePageState();
}

class _SKHomePageState extends State<SKHomePage> {

  File _imageFile;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("选择照片"),
              onPressed: getImage,
            ),
            _imageFile == null? Text("请选择一张照片"): Image.file(_imageFile),
          ],
        ),
      ),
    );
  }

  //ImagePicker.pickImage(source: ) 为过期方法
  void _pickImage() async {
    //  camera: 相机
    //  gallery: 相册
    File file = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = file;
      print('获取相册 $_imageFile');
    });
  }

  //建议使用picker.getImage(source: )
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = File(pickedFile.path);
      print('获取相册 $_imageFile');
    });
  }


}



