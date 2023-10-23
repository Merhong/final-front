import 'package:flutter/material.dart';

class JoinSubmitButton extends StatelessWidget {
  const JoinSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green, // 배경색을 녹색으로 설정
        padding: EdgeInsets.all(16.0), // 내부 패딩을 조정하여 가로 길이 맥스 어라이먼트 설정
      ).copyWith(
        minimumSize:
        MaterialStateProperty.all(Size(double.infinity, 50)), // 너비를 늘릴 수 있음
      ),
      onPressed: () {
        // 회원가입 로직 추가
      },
      child: Text("회원가입"),
    );
  }
}