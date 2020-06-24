
import 'package:flutter/material.dart';

class SKImageDetailPage extends StatelessWidget {
  final String _imageUrl;
  SKImageDetailPage(this._imageUrl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: GestureDetector(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: Hero(
              tag: _imageUrl,
              child: Image.network(_imageUrl)
          ),
        ),
      ),
    );
  }
}



