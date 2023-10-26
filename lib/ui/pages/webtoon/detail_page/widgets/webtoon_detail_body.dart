import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
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
      return Center(child: CircularProgressIndicator());
    }

    DetailPageWebtoonDTO webtoonDTO = model!.webtoonDTO;

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          elevation: 0,
          expandedHeight: 60,
          backgroundColor: Colors.white,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(color: Colors.blue),
          ),
        ),

        SliverToBoxAdapter(
          child: WebtoonDetailThumbnail(
            image: (webtoonDTO.episodeList != null && webtoonDTO.episodeList!.length != 0)
                ? "$imageURL/EpisodeThumbnail/${webtoonDTO.episodeList![0].thumbnail}"
                : "$imageURL/EpisodeThumbnail/default_episode_Thumbnail.jpg",
            interestCount: webtoonDTO.interestCount ?? -1, // TODO
          ),
        ),

        SliverToBoxAdapter(child: WebtoonDetailDescription(webtoonDTO: webtoonDTO)),

        // ListView.builder(
        //   itemCount: webtoon.episodeList!.length,
        //   itemBuilder: (context, index) {
        //     return WebtoonDetailEpisode(index: index, webtoon: webtoon);
        //   },
        // ),

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
