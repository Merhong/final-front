import 'package:flutter/material.dart';

class WebtoonRecommendMiddleBar extends StatelessWidget {
  const WebtoonRecommendMiddleBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: Container(
        height: 50,
        color: Colors.grey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // 왼쪽과 오른쪽 정렬
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    // 최신순 버튼 눌렀을 때의 동작 추가
                  },
                  child: Row(
                    children: [
                      Text("최신순"),
                      Icon(Icons.arrow_drop_down), // 화살표 아이콘 추가
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    // 전체 장르 버튼 눌렀을 때의 동작 추가
                  },
                  child: Row(
                    children: [
                      Text("전체 장르"),
                      Icon(Icons.arrow_drop_down), // 화살표 아이콘 추가
                    ],
                  ),
                ),
              ],
            ),
            Text("총 1089작품"),
          ],
        ),
      ),
    );
  }
}
