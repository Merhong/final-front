import 'package:flutter/material.dart';

class DotTab extends StatelessWidget {
  final String text;

  DotTab({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.brightness_1, // 원형 아이콘을 점으로 사용
          size: 6, // 점의 크기 조절
          color: Colors.grey, // 점의 색상 설정
        ),
        SizedBox(width: 2), // 점과 텍스트 사이에 공백
        Text(text),
      ],
    );
  }
}
