import 'package:flutter/material.dart';

AppBar cookieAppBar() {
  return AppBar(
      backgroundColor: Colors.white,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          child: Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
      ),
      leadingWidth: 15.0,
      title: Text(
        "쿠키샵",
        style: TextStyle(
          color: Colors.black,
          // 다른 스타일 속성을 필요에 따라 추가할 수 있습니다.
        ),
      ));
}
