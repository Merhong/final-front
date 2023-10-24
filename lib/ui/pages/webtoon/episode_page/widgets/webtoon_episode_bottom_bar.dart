import 'package:flutter/material.dart';

class WebtoonEpisodeBottomBar extends StatelessWidget {
  const WebtoonEpisodeBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.comment, color: Colors.white),
                onPressed: () {
                  // 댓글 아이콘을 눌렀을 때 수행할 작업 추가
                },
              ),
              Text("50", style: TextStyle(color: Colors.white)),
              SizedBox(width: 10),
              IconButton(
                icon: Icon(Icons.favorite_border, color: Colors.white),
                onPressed: () {
                  // 빈 하트 아이콘을 눌렀을 때 수행할 작업 추가
                },
              ),
              Text("23.665", style: TextStyle(color: Colors.white)),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  // 왼쪽으로 넘어가는 아이콘을 눌렀을 때 수행할 작업 추가
                },
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward, color: Colors.white),
                onPressed: () {
                  // 오른쪽으로 넘어가는 아이콘을 눌렀을 때 수행할 작업 추가
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
