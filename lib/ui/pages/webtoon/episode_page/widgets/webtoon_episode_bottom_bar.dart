import 'package:flutter/material.dart';
import 'package:flutter_blog/data/dto/episode_dto/episode_DTO.dart';
import 'package:flutter_blog/ui/pages/webtoon/reply_page/webtoon_reply_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WebtoonEpisodeBottomBar extends ConsumerWidget {
  EpisodeDTO? episodeDTO;

  WebtoonEpisodeBottomBar({this.episodeDTO});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomAppBar(
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.favorite_border, color: Colors.white),
                onPressed: () {
                  // 빈 하트 아이콘을 눌렀을 때 수행할 작업 추가
                },
              ),
              Text("${episodeDTO!.likeEpisodeCount}",
                  style: TextStyle(color: Colors.white)),
              SizedBox(width: 10),
              IconButton(
                icon: Icon(Icons.comment, color: Colors.white),
                onPressed: () {
                  print("댓글보기클릭");
                  // ParamStore paramStore = ref.read(paramProvider);
                  // paramStore.addEpisodeDetailId(episodeDTO!.episodeId);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => ReplyPage()));
                },
              ),
              Text("${episodeDTO!.commentCount}",
                  style: TextStyle(color: Colors.white)),
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
