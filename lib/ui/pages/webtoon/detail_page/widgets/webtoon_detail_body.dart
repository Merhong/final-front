import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/dto/webtoon_DTO/detail_page_webtoon_DTO.dart';
import 'package:flutter_blog/data/provider/param_provider.dart';
import 'package:flutter_blog/ui/common_widgets/webtoon_list_item.dart';
import 'package:flutter_blog/ui/pages/webtoon/detail_page/webtoon_detail_page.dart';
import 'package:flutter_blog/ui/pages/webtoon/detail_page/webtoon_detail_view_model.dart';
import 'package:flutter_blog/ui/pages/webtoon/detail_page/widgets/webtoon_detail_description.dart';
import 'package:flutter_blog/ui/pages/webtoon/detail_page/widgets/webtoon_detail_episode.dart';
import 'package:flutter_blog/ui/pages/webtoon/detail_page/widgets/webtoon_detail_other.dart';
import 'package:flutter_blog/ui/pages/webtoon/detail_page/widgets/webtoon_detail_thumbnail.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WebtoonDetailBody extends ConsumerWidget {
  final ScrollController detailPageController;
  bool isScroll;
  DetailPageWebtoonDTO webtoonDTO;
  WebtoonDetailBody(this.detailPageController, this.isScroll, this.webtoonDTO);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scrollbar(
      // controller: detailPageController,
      // thumbVisibility: true,
      trackVisibility: true,
      thickness: 7,
      child: CustomScrollView(
        controller: detailPageController,
        slivers: [
          SliverToBoxAdapter(child: WebtoonDetailThumbnail(isScroll, webtoonDTO)),
          SliverToBoxAdapter(child: WebtoonDetailDescription(webtoonDTO)),
          webtoonDTO.episodeList.length == 0
              ? SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Text("에피소드가 하나도 없어요.", style: TextStyle(fontSize: 50)),
                      WebtoonDetailOther(webtoonDTO: webtoonDTO),
                    ],
                  ),
                )
              : SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: webtoonDTO.episodeList.length + 1,
                    (context, index) {
                      if (index != webtoonDTO.episodeList.length) {
                        return WebtoonDetailEpisode(index: index, webtoonDTO: webtoonDTO);
                      }
                      return WebtoonDetailOther(webtoonDTO: webtoonDTO);
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
