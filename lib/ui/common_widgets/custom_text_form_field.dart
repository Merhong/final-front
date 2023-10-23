import 'package:flutter/material.dart';

class CustomTextFormWidget extends StatelessWidget {
  final String text;
  final IconData iconData; // 아이콘 데이터 추가

  CustomTextFormWidget({required this.text, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Column의 children 속성으로 위젯 목록을 정의
        Container(
          height: 50,
          child: TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(iconData),
              hintText: "$text",
              border: OutlineInputBorder(),
              // login 페이지에서 받은 text
            ),
          ),
        ),
      ],
    );
  }
}
