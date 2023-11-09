import 'package:flutter/material.dart';

class SettingText extends StatelessWidget {
  final String text;

  SettingText({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      color: Colors.grey[300], // 배경 색상을 그레이로 설정
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
