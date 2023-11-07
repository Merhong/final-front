import 'package:flutter/material.dart';

class SettingButton extends StatelessWidget {
  final String text;
  final String navigateToPageText; // 버튼을 클릭했을 때 이동할 페이지를 식별하는 텍스트
  final Function()? onPressed; // 버튼이 클릭될 때 실행될 함수

  SettingButton({
    required this.text,
    required this.navigateToPageText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 8.0, bottom: 8.0, left: 16, right: 16), // 수직 방향으로 8씩 패딩 추가
      child: GestureDetector(
        onTap: () {
          // 클릭 시 onPressed 함수 실행
          if (onPressed != null) {
            onPressed!();
          }
        },
        child: Row(
          children: [
            Text(text),
            Spacer(),
            Text(navigateToPageText), // ">" 버튼 대신 텍스트 표시
          ],
        ),
      ),
    );
  }
}
