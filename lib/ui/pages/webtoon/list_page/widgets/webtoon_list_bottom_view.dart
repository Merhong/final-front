import 'package:flutter/material.dart';

class WebtoonListBottomView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.horizontal, // 수평 스크롤 설정
      itemCount: 5, // 웹툰 항목 수에 맞게 수정
      itemBuilder: (context, pageIndex) {
        return Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            children: List.generate(3, (index) {
              return WebtoonCard(pageIndex * 3 + index);
            }),
          ),
        );
      },
    );
  }
}

class WebtoonCard extends StatelessWidget {
  final int index;

  WebtoonCard(this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 3.0,
          child: Column(
            children: [
              Container(
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/default_webtoon_Thumbnail.jpg", // 이미지 파일 경로 수정
                      fit: BoxFit.cover,
                      height: 150.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Webtoon $index'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
