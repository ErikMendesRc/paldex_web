import 'package:flutter/material.dart';

class MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    final smallerSize = size.width * 0.7;
    final offsetX = (size.width - smallerSize) / 2;
    final offsetY = (size.height - smallerSize) / 2;

    return Rect.fromLTWH(offsetX, offsetY, smallerSize, smallerSize);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}
