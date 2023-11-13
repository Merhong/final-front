import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/data/dto/webtoon_DTO/detail_page_webtoon_DTO.dart';
import 'package:flutter_blog/data/provider/param_provider.dart';
import 'package:flutter_blog/ui/pages/webtoon/detail_page/webtoon_detail_page.dart';
import 'package:flutter_blog/ui/pages/webtoon/detail_page/webtoon_detail_view_model.dart';
import 'package:flutter_blog/ui/pages/webtoon/episode_page/webtoon_episode_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WebtoonListBottomRandom extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return InkWell(
            onTap: () async {
              await ref.read(webtoonDetailProvider.notifier).notifyRandom();

              ParamStore paramStore = ref.read(paramProvider);

              Navigator.push(context, MaterialPageRoute(builder: (_) => WebtoonDetailPage()));

              //   Navigator.push(context,
              //       MaterialPageRoute(builder: (_) => WebtoonEpisodePage()));
              //
            },
            child: Column(
              children: [
                Divider(color: Colors.black26, height: 1, thickness: 1),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(CupertinoIcons.question_circle_fill, color: Colors.green),
                      Text(' 랜덤 작품 ', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold)),
                      Text('보러가기', style: TextStyle(fontSize: 18, color: Colors.black)),
                      Text(' >', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        childCount: 1, // 랜덤작품보러가기 텍스트 1개만 표시
      ),
    );
  }
}
