import 'package:flutter/material.dart';

AppBar cookieAppBar() {
  return AppBar(
      automaticallyImplyLeading: true, // 뒤로 가기 버튼 표시 여부
      iconTheme: IconThemeData(
        color: Colors.black, // 뒤로 가기 버튼 아이콘 색상을 검은색으로 설정
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      title: Center(
        child: Text(
          "쿠키샵",
          style: TextStyle(
            color: Colors.black,
            // 다른 스타일 속성을 필요에 따라 추가할 수 있습니다.
          ),
        ),
      ));
}
