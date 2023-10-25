import 'package:flutter/material.dart';

class WebtoonCircleList extends StatelessWidget {
  const WebtoonCircleList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: Container(
        height: 120,
        color: Colors.grey,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            for (int i = 0; i < 5; i++)
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20), // 그림 위에 여백 설정
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(
                              "assets/default_episode_Thumbnail.jpg"),
                        ),
                      ),
                      Text("User $i"),
                    ],
                  )),
          ],
        ),
      ),
    );
  }
}
