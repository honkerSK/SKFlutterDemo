

import 'package:flutter/material.dart';

class SKStarRating extends StatefulWidget {
  
  final double rating; //必传参数，告诉Widget当前的评分
  final double maxRating; //可选参数，最高评分，根据它来计算一个比例，默认值为10
  final int count;  //展示星星的个数
  final double size; //星星的大小，决定每一个star的大小
  final Color unselectedColor; //未选中星星的颜色（该属性是使用默认的star才有效）
  final Color selectedColor; //选中星星的颜色（该属性也是使用默认的star才有效）

  final Widget unselectedImage; //定制未选中的star
  final Widget selectedImage; //定义选中时的star

  SKStarRating({
    @required this.rating,
    this.maxRating = 10,
    this.count = 5,
    this.size = 30,
    this.unselectedColor = const Color(0xffbbbbbb),
    this.selectedColor = const Color(0xffff0000),
    Widget unselectedImage,
    Widget selectedImage
  }): unselectedImage = unselectedImage ?? Icon(Icons.star_border, color: unselectedColor, size: size),
        selectedImage = selectedImage ?? Icon(Icons.star, color: selectedColor, size: size);

  @override
  _SKStarRatingState createState() => _SKStarRatingState();
}

class _SKStarRatingState extends State<SKStarRating> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Row(mainAxisSize: MainAxisSize.min, children: buildUnselectedStar()),
        Row(mainAxisSize: MainAxisSize.min, children: buildSelectedStar())
      ],
    );
  }

  List<Widget> buildUnselectedStar() {
    return List.generate(widget.count, (index) {
      return widget.unselectedImage;
    });
  }

  List<Widget> buildSelectedStar() {
    // 1.创建stars
    List<Widget> stars = [];
    final star = widget.selectedImage;

    // 2.构建满填充的star
    double oneValue = widget.maxRating / widget.count;
    int entireCount = (widget.rating / oneValue).floor();
    for (var i = 0; i < entireCount; i++) {
      stars.add(star);
    }

    // 3.构建部分填充star
    // (widget.rating / oneValue) 3.5 - 3 = 0.5 * widget.size
    double leftWidth = ((widget.rating / oneValue) - entireCount) * widget.size;
    final halfStar = ClipRect(
        clipper: SKStarClipper(leftWidth),
        child: star
    );
    stars.add(halfStar);

    if (stars.length > widget.count) {
      return stars.sublist(0, widget.count);
    }

    return stars;
  }
}


class SKStarClipper extends CustomClipper<Rect> {
  double width;

  SKStarClipper(this.width);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, width, size.height);
  }

  @override
  bool shouldReclip(SKStarClipper oldClipper) {
    return oldClipper.width != this.width;
  }
}
