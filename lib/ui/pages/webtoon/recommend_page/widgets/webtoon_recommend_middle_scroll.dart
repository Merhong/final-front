import 'package:flutter/material.dart';

class WebtoonRecommendMiddleScroll extends StatelessWidget {
  const WebtoonRecommendMiddleScroll({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Container(
        height: 140, // 아래의 ListView의 높이와 일치시켜야합니다.
        color: Colors.grey,
        child: ListView(
          scrollDirection: Axis.horizontal, // 수평 스크롤 설정
          children: List.generate(10, (index) {
            return Container(
              width: 200, // 이미지의 너비를 조절하여 크기 조정
              height: 200, // 이미지의 높이를 조절하여 크기 조정
              color: Colors.grey, // 배경색 설정
              child: Column(
                children: [
                  Image.asset('assets/default_episode_Thumbnail.jpg'), // 이미지
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
