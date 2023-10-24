import 'package:flutter/material.dart';

class WebtoonEpisodeImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.horizontal, // 수평 스크롤로 변경
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: 100.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/default_episode_Thumbnail.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
