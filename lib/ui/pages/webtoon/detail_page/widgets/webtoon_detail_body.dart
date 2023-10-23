import 'package:flutter/material.dart';
import 'package:flutter_blog/data/model/webtoon.dart';
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
      return Center(child: CircularProgressIndicator());
    }

    Webtoon webtoon = model!.webtoon;

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: 60,
          backgroundColor: Colors.white,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(color: Colors.blue),
          ),
        ),

        SliverToBoxAdapter(
          child: WebtoonDetailThumbnail(
            image: (webtoon.episodeList != null && webtoon.episodeList!.length != 0)
                ? "assets/EpisodeThumbnail/${webtoon.episodeList![0].thumbnail}"
                : "assets/EpisodeThumbnail/default_webtoon_Thumbnail.jpg",
            likeCount: webtoon.likeCount!,
          ),
        ),

        SliverToBoxAdapter(child: WebtoonDetailDescription(webtoon: webtoon)),

        // ListView.builder(
        //   itemCount: webtoon.episodeList!.length,
        //   itemBuilder: (context, index) {
        //     return WebtoonDetailEpisode(index: index, webtoon: webtoon);
        //   },
        // ),

        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: webtoon.episodeList!.length,
            (context, index) {
              return WebtoonDetailEpisode(index: index, webtoon: webtoon);
            },
          ),
        ),
      ],
    );
  }
}
