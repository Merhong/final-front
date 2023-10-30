import 'package:flutter/material.dart';

class CustomPreviewNumber extends StatelessWidget {
  const CustomPreviewNumber({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: Container(
        height: 120,
        color: Colors.grey,
        child: Row(
          children: [
            Image.asset('assets/default_episode_Thumbnail.jpg'), // 이미지 추가
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "살아남은 로맨스",
                    style: TextStyle(
                      fontWeight: FontWeight.bold, // 텍스트를 두꺼운 스타일로 설정
                    ),
                  ),
                  Text("이연"),
                  Text("세상에 이런 장르는 없다"),
                  Text("핵폭탄급 아이돌 전쟁"),
                  SizedBox(height: 5),
                  Text("총 103화"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
