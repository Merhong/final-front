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

              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => WebtoonDetailPage()));

              //   Navigator.push(context,
              //       MaterialPageRoute(builder: (_) => WebtoonEpisodePage()));
              //
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
            ),
          );
        },
        childCount: 1, // 랜덤작품보러가기 텍스트 1개만 표시
      ),
    );
  }
}
