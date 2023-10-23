import 'package:flutter/material.dart';

import '../../_core/constants/size.dart';

class Advertising extends StatelessWidget {
  String ADImg;
  double ADHeight;

  Advertising({
    this.ADImg = "assets/default_AD.jpg",
    this.ADHeight = sizeXL50,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(sizeBorder5)),
      child: Container(
        width: double.infinity,
        height: ADHeight,
        child: Image.asset(ADImg, fit: BoxFit.cover),
      ),
    );
  }
}
