import 'package:flutter/material.dart';

class WebtoonRecommendBotoomList extends StatelessWidget {
  const WebtoonRecommendBotoomList({
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
              // 왼쪽에 이미지를 배치
              Image.asset(
                "assets/default_episode_Thumbnail.jpg", // 이미지 파일 경로
                width: 150, // 이미지 너비 조정
                height: 220, // 이미지 높이 조정
                fit: BoxFit.fitWidth, // 이미지 크기 조정 (항목을 채우지 않고 비율 유지)
              ),
              SizedBox(width: 25), // 요소 사이의 간격 조정
              // 오른쪽에 텍스트를 배치
              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // 텍스트를 왼쪽 정렬로 배치
                  children: [
                    SizedBox(height: 25),
                    Text(
                      "안미운 우리들",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "지피",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "나의 의별을 바라는 남사친",
                      style: TextStyle(
                        color: Colors.black, // 텍스트 색상을 흰색으로 설정
                      ),
                    ),
                    Text(
                      " 총 81화",
                      style: TextStyle(
                        color: Colors.black, // 텍스트 색상을 흰색으로 설정
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
