import 'package:flutter/material.dart';

class MyInterestWebtoon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white, // 배경색을 원하는 색상으로 설정
          child: Row(
            children: [
              Text(
                "전체1", // 첫 번째 텍스트
                style: TextStyle(
                  color: Colors.black, // 텍스트 색상 설정
                  fontWeight: FontWeight.bold, // 텍스트 굵기 설정
                ),
              ),
              SizedBox(width: 10), // 텍스트 사이의 간격 조절
              Text(
                "업데이트 순", // 두 번째 텍스트
                style: TextStyle(
                  color: Colors.black, // 텍스트 색상 설정
                  fontWeight: FontWeight.bold, // 텍스트 굵기 설정
                ),
              ),
              Spacer(),
              Text(
                "편집", // 두 번째 텍스트
                style: TextStyle(
                  color: Colors.black, // 텍스트 색상 설정
                  fontWeight: FontWeight.bold, // 텍스트 굵기 설정
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  height: 90,
                  color: Colors.white,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // 왼쪽에 이미지를 배치
                      Image.asset(
                        "assets/default_episode_Thumbnail.jpg",
                        width: 150,
                        height: 120,
                        fit: BoxFit.fitWidth,
                      ),
                      SizedBox(width: 10),
                      // 중앙에 제목과 날짜 배치
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "안미운 우리들",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "23.10.22",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      // 오른쪽에 알림 아이콘 추가
                      SizedBox(width: 85),
                      Icon(
                        Icons.notifications, // 알림 아이콘
                        color: Colors.black, // 아이콘 색상
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
