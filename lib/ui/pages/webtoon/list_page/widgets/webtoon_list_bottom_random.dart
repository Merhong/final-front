import 'package:flutter/material.dart';

class WebtoonListBottomRandom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return GestureDetector(
              onTap: () {
                // 랜덤 작품 보러가기를 클릭했을 때의 동작을 추가할 수 있습니다.
              },
              child: Container(
                padding: EdgeInsets.all(30.0),
                child: Text(
                  '랜덤작품보러가기>',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ));
        },
        childCount: 1, // 랜덤작품보러가기 텍스트 1개만 표시
      ),
    );
  }
}
