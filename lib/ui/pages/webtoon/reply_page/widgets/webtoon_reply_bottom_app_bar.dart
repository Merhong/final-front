import 'package:flutter/material.dart';

class WebtoonReplyBottomAppBar extends StatelessWidget {
  const WebtoonReplyBottomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // TODO : Form태그로 묶어서 등록누르면 Comment DB에 입력될 수 있게 통신해야 함!!!
          Text(
            "댓글을 입력해주세요 :)",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
          TextButton(
            onPressed: () {
              print("등록버튼 눌러짐.");
            },
            child: Text("등록"),
          ),
        ],
      ),
    );
  }
}