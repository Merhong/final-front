import 'package:flutter/material.dart';

class DrawTriangle extends CustomPainter {
  Color color;

  DrawTriangle({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    path.moveTo(0, size.height); // 시작위치 // 0,0이면 왼쪽 위
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    canvas.drawPath(path, Paint()..color = color);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
