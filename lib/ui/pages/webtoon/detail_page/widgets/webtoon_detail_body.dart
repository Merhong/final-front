import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/dto/webtoon_DTO/detail_page_webtoon_DTO.dart';
import 'package:flutter_blog/ui/pages/webtoon/detail_page/webtoon_detail_view_model.dart';
import 'package:flutter_blog/ui/pages/webtoon/detail_page/widgets/webtoon_detail_description.dart';
import 'package:flutter_blog/ui/pages/webtoon/detail_page/widgets/webtoon_detail_episode.dart';
import 'package:flutter_blog/ui/pages/webtoon/detail_page/widgets/webtoon_detail_thumbnail.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WebtoonDetailBody extends ConsumerWidget {
  const WebtoonDetailBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WebtoonDetailModel? model = ref.watch(webtoonDetailProvider);

    if (model == null) {
      ref.read(webtoonDetailProvider.notifier).notifyInit();
      return Center(child: CircularProgressIndicator());
    }

    DetailPageWebtoonDTO webtoonDTO = model.webtoonDTO!;

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          actions: [
            webtoonDTO.isInterest == true
                ? Row(
                    children: [
                      InkWell(
                        onTap: () => ref.read(webtoonDetailProvider.notifier).notifyInterestDelete(),
                        child: Row(
                          children: [
                            Icon(CupertinoIcons.check_mark_circled_solid),
                            Text("관심", style: TextStyle(color: Colors.white, fontSize: 20)),
                          ],
                        ),
                      ),
                      SizedBox(width: sizeM10),
                      Icon(Icons.notifications_off_outlined), // TODO
                      // Icon(Icons.notifications_on), // TODO
                      SizedBox(width: sizeL20),
                    ],
                  )
                : InkWell(
                    onTap: () => ref.read(webtoonDetailProvider.notifier).notifyInterestCreate(),
                    child: Row(
                      children: [
                        Icon(CupertinoIcons.plus_circle),
                        Text("관심 추가", style: TextStyle(color: Colors.white, fontSize: 20)),
                        SizedBox(width: sizeL20),
                      ],
                    ),
                  ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu),
            )
          ],
          pinned: true,
          elevation: 0,
          expandedHeight: 60,
          backgroundColor: Colors.white,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(color: Colors.blue),
          ),
        ),

        SliverToBoxAdapter(
          child: WebtoonDetailThumbnail(webtoonDTO: webtoonDTO),
        ),

        SliverToBoxAdapter(child: WebtoonDetailDescription(webtoonDTO: webtoonDTO)),

        // ListView.builder(
        //   itemCount: webtoon.episodeList!.length,
        //   itemBuilder: (context, index) {
        //     return WebtoonDetailEpisode(index: index, webtoon: webtoon);
        //   },
        // ),
        //

        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: webtoonDTO.episodeList!.length,
            (context, index) {
              return WebtoonDetailEpisode(index: index, webtoonDTO: webtoonDTO);
            },
          ),
        ),
      ],
    );
  }
}
