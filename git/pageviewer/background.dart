import 'dart:ui';
import 'package:flutter/material.dart';

class ApplyBackground extends StatelessWidget {
  final String imgURL;

  ApplyBackground(this.imgURL);

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage(imgURL),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
          decoration: new BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.3),
          ),
        ),
    );
  }
}