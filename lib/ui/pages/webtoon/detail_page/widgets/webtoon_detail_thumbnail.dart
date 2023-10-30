import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/dto/webtoon_DTO/detail_page_webtoon_DTO.dart';
import 'package:flutter_blog/ui/common_widgets/my_stackbar.dart';
import 'package:flutter_blog/ui/pages/webtoon/detail_page/webtoon_detail_view_model.dart';
import 'package:flutter_blog/ui/pages/webtoon/detail_page/widgets/webtoon_detail_appbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class WebtoonDetailThumbnail extends ConsumerWidget {
  bool isScroll;
  final DetailPageWebtoonDTO webtoonDTO;

  WebtoonDetailThumbnail(this.isScroll, this.webtoonDTO);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Container(height: 170, color: !isScroll ? IdToColor(webtoonDTO.id) : Colors.transparent),
        Column(
          children: [
            SizedBox(height: 90),
            Stack(
              children: [
                buildThumbnail(context),
                buildInteresting(context, ref),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget buildInteresting(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 175,
      child: Align(
        alignment: Alignment(0, 1),
        child: InkWell(
          onTap: () {
            if (webtoonDTO.isInterest) {
              ref.read(webtoonDetailProvider.notifier).notifyInterestDelete();
              mySnackbar(
                context,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.sentiment_very_dissatisfied, color: IdToColor(webtoonDTO.id)),
                    Text(" 관심 웹툰을 해제하였습니다."),
                  ],
                ),
              );
            } else {
              ref.read(webtoonDetailProvider.notifier).notifyInterestCreate();
              mySnackbar(
                context,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_reaction_outlined, color: IdToColor(webtoonDTO.id)),
                    Text(" 관심 웹툰으로 등록하였습니다."),
                  ],
                ),
              );
            }
          },
          child: webtoonDTO.isInterest == true
              ? Container(
                  height: 30,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: sizeM10),
                    child: Text("✔ 관심 ${NumberFormat('#,###').format(webtoonDTO.interestCount)}",
                        style: TextStyle(color: IdToColor(webtoonDTO.id), fontWeight: FontWeight.w500, fontSize: 17)),
                  ),
                )
              : Container(
                  height: 30,
                  decoration: BoxDecoration(color: IdToColor(webtoonDTO.id), borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: sizeM10),
                    child: Text("+ 관심 ${NumberFormat('#,###').format(webtoonDTO.interestCount)}",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 17)),
                  ),
                ),
        ),
      ),
    );
  }

  Widget buildThumbnail(BuildContext context) {
    return Center(
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
              (webtoonDTO.episodeList != null && webtoonDTO.episodeList!.length != 0)
                  ? "${imageURL}/EpisodeThumbnail/${webtoonDTO.episodeList![0].thumbnail}"
                  : "${imageURL}/EpisodeThumbnail/default_episode_Thumbnail.jpg",
              fit: BoxFit.cover,
              height: 190,
              width: sizeGetScreenWidth(context) * 0.85)),
    );
  }
}
