import 'package:flutter/material.dart';

class CustomTextFormWidget extends StatelessWidget {
  final String text;
  final IconData iconData; // 아이콘 데이터 추가

  final bool obscureText;
  final funValidator;
  final TextEditingController controller;

  CustomTextFormWidget({
    required this.text,
    required this.iconData,
    this.obscureText = false,
    required this.funValidator,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Column의 children 속성으로 위젯 목록을 정의
        Container(
          height: 50,
          child: TextFormField(
            controller: controller,
            validator: funValidator,
            obscureText: obscureText,
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
