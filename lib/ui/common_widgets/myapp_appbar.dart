import 'package:flutter/material.dart';

class MyappAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white, // 앱바 배경색을 흰색으로 설정
      leading: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16), // 왼쪽 여백을 추가
        child: Row(
          children: [
            Text(
              "MY",
              // 텍스트 스타일 설정
              style: TextStyle(
                fontSize: 16, // 텍스트 크기 설정 (원하는 크기로 수정)
                fontWeight: FontWeight.bold, // 텍스트 굵기 설정
                color: Colors.black, // 텍스트 색상을 검은색으로 설정
              ),
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 17),
          child: Row(
            children: [
              Text(
                "내 쿠키 0 >   ",
                // 텍스트 스타일 설정
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              Icon(Icons.search, color: Colors.black),
            ],
          ),
        ),
      ],
    );
  }
}