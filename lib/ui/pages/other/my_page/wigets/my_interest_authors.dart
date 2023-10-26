import 'package:flutter/material.dart';

class MyInterestAuthors extends StatelessWidget {
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
                "업데이트 순 ", // 두 번째 텍스트
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
                  height: 100,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // 왼쪽에 이미지를 서클 아바타로 배치
                      ClipOval(
                        child: Image.asset(
                          "assets/default_episode_Thumbnail.jpg",
                          width: 80, // 이미지의 너비 조정
                          height: 80, // 이미지의 높이 조정
                          fit: BoxFit.cover, // 이미지가 원 모양으로 잘리도록 설정
                        ),
                      ),
                      SizedBox(width: 25),
                      // 오른쪽에 텍스트를 배치
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "주동근",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "야도나이 작가",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "14일 전 새 소식",
                            style: TextStyle(
                              color: Colors.green,
                            ),
                          ),
                        ],
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
