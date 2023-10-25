import 'package:flutter/material.dart';

class CustomPrivewImage extends StatelessWidget {
  const CustomPrivewImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: Container(
        height: 150,
        color: Colors.grey,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5, // 원하는 이미지 수로 변경
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: 150, // 이미지 너비 조정
              height: 230, // 이미지 높이 조정
              margin: EdgeInsets.only(right: 5),
              child: Column(
                children: [
                  Image.asset(
                    'assets/default_episode_Thumbnail.jpg', // 이미지 파일 경로
                    fit: BoxFit.fitWidth,
                  ),
                  Text(
                    '영월동 534번지', // 첫 번째 텍스트 내용
                    style: TextStyle(
                      fontSize: 16, // 텍스트 크기 조정
                      fontWeight: FontWeight.bold, // 텍스트 스타일 조정
                    ),
                  ),
                  Text(
                    '임성훈 / 정보근', // 두 번째 텍스트 내용
                    style: TextStyle(
                      fontSize: 14, // 텍스트 크기 조정
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
