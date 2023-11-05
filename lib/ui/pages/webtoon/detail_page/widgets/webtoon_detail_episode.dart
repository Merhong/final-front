import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/webtoon_DTO/detail_page_webtoon_DTO.dart';
import 'package:flutter_blog/data/provider/param_provider.dart';
import 'package:flutter_blog/ui/pages/webtoon/detail_page/widgets/draw_is_view1.dart';
import 'package:flutter_blog/ui/common_widgets/draw_triangle.dart';
import 'package:flutter_blog/ui/pages/webtoon/detail_page/widgets/draw_is_view2.dart';
import 'package:flutter_blog/ui/pages/webtoon/episode_page/webtoon_episode_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../../_core/constants/size.dart';
import '../../../../common_widgets/title_tag.dart';

class WebtoonDetailEpisode extends ConsumerWidget {
  WebtoonDetailEpisode({
    super.key,
    required this.webtoonDTO,
    required this.index,
  });

  final int index;
  final DetailPageWebtoonDTO webtoonDTO;
  DateFormat dateFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ");
  NumberFormat numberFormat = NumberFormat("0.00");

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        print("에피소드보기   클릭");
        ParamStore ps = ref.read(paramProvider);
        ps.addWebtoonLastEpisode(webtoonDTO.episodeList[0].episodeId);
        ps.addWebtoonFirstEpisode(webtoonDTO.episodeList[webtoonDTO.episodeList.length - 1].episodeId);
        ps.addEpisodeDetailId(webtoonDTO.episodeList[index].episodeId);
        Navigator.push(context, MaterialPageRoute(builder: (_) => WebtoonEpisodePage()));
      },
      child: Container(
        color: webtoonDTO.episodeList[index].isView == true ? Color.fromRGBO(200, 200, 200, 1) : Colors.white,
        child: Column(
          children: [
            Divider(color: Colors.grey, height: 1, thickness: 1),
            Stack(
              children: [
                webtoonDTO.episodeList[index].isLastView == true
                    ? Positioned(right: 0, child: CustomPaint(size: Size(40, 40), painter: DrawIsView1(color: Color.fromRGBO(170, 170, 170, 1))))
                    : SizedBox(),
                webtoonDTO.episodeList[index].isLastView == true
                    ? Positioned(right: 0, child: CustomPaint(size: Size(40, 40), painter: DrawIsView2(color: Colors.white)))
                    : SizedBox(),
                Padding(
                  padding: EdgeInsets.fromLTRB(sizePaddingLR17, sizeS5, sizePaddingLR17, sizeS5),
                  child: Row(
                    children: [
                      SizedBox(
                        width: sizeGetScreenWidth(context) * 0.25,
                        height: sizeXL50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(sizeBorder5),
                          child: Image.network('$imageURL/EpisodeThumbnail/${webtoonDTO.episodeList![index].thumbnail}', fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              "assets/default_episode_Thumbnail.jpg",
                              fit: BoxFit.cover,
                            );
                          }),
                        ),
                      ),
                      SizedBox(width: sizeM10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("${webtoonDTO.episodeList![index].detailTitle} "),
                              DateTime.now().difference(webtoonDTO.episodeList[index].createdAt).inHours < 50
                                  ? TitleTag(titleTagEnum: TitleTagEnum.up)
                                  : SizedBox(),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                  "★${(webtoonDTO.episodeList![index].starScore / webtoonDTO.episodeList![index].starCount == 0 ? 1 : webtoonDTO.episodeList![index].starCount).toStringAsFixed(2)}   ${DateFormat('yyyy-MM-dd').format(webtoonDTO.episodeList![index].createdAt)}",
                                  style: TextStyle(fontSize: 10, color: Colors.grey[600])),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
