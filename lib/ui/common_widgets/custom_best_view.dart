import 'package:flutter/material.dart';

class CustomBestView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
                    "힐러님 뭐하세요?",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "시트콤 같은 일상툰",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.red,
                      ),
                      Text(
                        "9.13",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                      Text(
                        "   11:07",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
