import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/my_color.dart';
import 'package:flutter_blog/ui/common_widgets/draw_triangle.dart';

enum SpeciallyTagEnum { free, rank, isNew } // new 예약어라 못함 // end, stop,

class SpeciallyTag extends StatelessWidget {
  SpeciallyTagEnum speciallyTagEnum;

  SpeciallyTag({required this.speciallyTagEnum});

  @override
  Widget build(BuildContext context) {
    return speciallyTagEnum == SpeciallyTagEnum.rank
        ? Stack(
            children: [
              Align(
                  alignment: Alignment(1, 1),
                  child: CustomPaint(
                      size: Size(75, 25),
                      painter: DrawTriangle(color: CommonColors.green))),
              Align(
                  alignment: Alignment(1, 1),
                  child: Text("순위 상승",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold))),
            ],
          )
        : speciallyTagEnum == SpeciallyTagEnum.isNew
            ? Padding(
                padding: EdgeInsets.all(3.0),
                child: CircleAvatar(
                    backgroundColor: CommonColors.green,
                    radius: 15,
                    child: Text("신작",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold))),
              )
            : speciallyTagEnum == SpeciallyTagEnum.free
                ? Stack(
                    children: [
                      Icon(Icons.circle, size: 36, color: Colors.black),
                      Positioned(
                          right: 3,
                          bottom: 3,
                          child: Icon(CupertinoIcons.clock,
                              color: CommonColors.green, size: 30)),
                    ],
                  )
                : SizedBox();
  }
}
