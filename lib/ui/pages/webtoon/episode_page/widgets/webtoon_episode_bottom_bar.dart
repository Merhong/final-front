import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/data/dto/episode_dto/episode_DTO.dart';
import 'package:flutter_blog/data/provider/param_provider.dart';
import 'package:flutter_blog/ui/pages/webtoon/episode_page/webtoon_episode_view_model.dart';
import 'package:flutter_blog/ui/pages/webtoon/episode_page/webtoon_episode_page.dart';
import 'package:flutter_blog/ui/pages/webtoon/reply_page/webtoon_reply_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WebtoonEpisodeBottomBar extends ConsumerWidget {
  EpisodeDTO episodeDTO;

  WebtoonEpisodeBottomBar({required this.episodeDTO});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ParamStore ps = ref.read(paramProvider);
    WebtoonEpisodeModel? model = ref.watch(webtoonEpisodeProvider);

    return BottomAppBar(
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              // Todo: 좋아요 취소기능도 만들어야함
              IconButton(
                icon: _likeIcon(episodeDTO.like),
                onPressed: () async {
                  ref.watch(webtoonEpisodeProvider.notifier).likeEpisode();
                },
              ),
              Text("${episodeDTO.likeEpisodeCount}",
                  style: TextStyle(color: Colors.white)),
              SizedBox(width: 10),
              IconButton(
                icon: Icon(Icons.comment, color: Colors.white),
                onPressed: () {
                  print("댓글보기클릭");
                  // ps.addEpisodeDetailId(episodeDTO!.episodeId);
                  Navigator.push(context, MaterialPageRoute(builder: (_) => ReplyPage()));
                },
              ),
              Text("${episodeDTO.commentCount}",
                  style: TextStyle(color: Colors.white)),
            ],
          ),
          Row(
            children: [
              ps.webtoonFirstEpisodeId != episodeDTO!.episodeId
                  ? IconButton(
                      icon: Icon(Icons.arrow_left, color: Colors.white, size: 30),
                      onPressed: () {
                        ps.isEpisodeMove = true;
                        ps.addEpisodeDetailId((episodeDTO!.episodeId) + 1); // 역순정렬?
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => WebtoonEpisodePage()));
                      },
                    )
                  : IconButton(onPressed: () {}, icon: Icon(Icons.arrow_left, color: Colors.grey[700], size: 30)),
              //
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_left, color: Colors.white)),
              //
              ps.webtoonLastEpisodeId != episodeDTO!.episodeId
                  ? IconButton(
                      icon: Icon(Icons.arrow_right, color: Colors.white, size: 30),
                      onPressed: () {
                        ps.isEpisodeMove = true;
                        ps.addEpisodeDetailId((episodeDTO!.episodeId) - 1); // 역순정렬?
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => WebtoonEpisodePage()));
                      },
                    )
                  : IconButton(onPressed: () {}, icon: Icon(Icons.arrow_right, color: Colors.grey[700], size: 30)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _likeIcon(bool like) {
    if (like == true) {
      return Icon(CupertinoIcons.heart_fill, color: Colors.red);
    } else {
      return Icon(Icons.favorite_border, color: Colors.white);
    }
  }
}
