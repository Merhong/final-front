import 'package:flutter/material.dart';

import '../../_core/constants/size.dart';

class BottomRule extends StatelessWidget {
  const BottomRule({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: Column(
        children: [
          Divider(color: Colors.grey, height: 1),
          SizedBox(height: sizeL20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(),
              Text("네이버웹툰 이용약관", style: TextStyle(fontSize: 11)),
              SizedBox(width: sizeM10),
              Container(height: sizeM10, color: Colors.black, width: 1),
              SizedBox(width: sizeM10),
              Text("전용상품권 이용약관", style: TextStyle(fontSize: 11)),
              SizedBox(width: sizeM10),
              Container(height: sizeM10, color: Colors.black, width: 1),
              SizedBox(width: sizeM10),
              Text("개인정보 처리방침", style: TextStyle(fontSize: 11)),
              SizedBox(),
            ],
          ),
          SizedBox(height: sizeM10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("고객센터", style: TextStyle(fontSize: sizeM10)),
              SizedBox(width: sizeM10),
              Container(height: sizeM10, color: Colors.black, width: 1),
              SizedBox(width: sizeM10),
              Text("오류신고", style: TextStyle(fontSize: sizeM10)),
            ],
          ),
          SizedBox(height: sizeM10),
          Text("©️ NAVER WEBTOON Limited", style: TextStyle(fontSize: sizeM10)),
          SizedBox(height: sizeXL50)
        ],
      ),
    );
  }
}
