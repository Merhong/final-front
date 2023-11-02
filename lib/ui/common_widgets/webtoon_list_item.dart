import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/webtoon_DTO/list_page_webtoon_DTO.dart';
import 'package:flutter_blog/ui/common_widgets/specially_tag.dart';
import 'package:flutter_blog/ui/common_widgets/title_tag.dart';

import '../../_core/constants/size.dart';
import 'draw_triangle.dart';

class WebtoonListItem extends StatelessWidget {
  final ListPageWebtoonDTO webtoonDTO;

  const WebtoonListItem({
    super.key,
    required this.webtoonDTO,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(sizeBorder5),
          child: Stack(
            children: [
              Container(
                height: sizeWebtoonListItemPictureHeight160,
                child: Image.network(
                  "${imageURL}/WebtoonThumbnail/${webtoonDTO.image}",
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      "assets/default_webtoon_Thumbnail.jpg",
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              if (webtoonDTO.webtoonSpeciallyEnum == "순위") ...[
                Container(
                  height: sizeWebtoonListItemPictureHeight160,
                  child: SpeciallyTag(speciallyTagEnum: SpeciallyTagEnum.rank),
                ),
              ],
              if (webtoonDTO.webtoonSpeciallyEnum == "신작") SpeciallyTag(speciallyTagEnum: SpeciallyTagEnum.isNew),
              if (webtoonDTO.webtoonSpeciallyEnum == "무료") SpeciallyTag(speciallyTagEnum: SpeciallyTagEnum.free),
            ],
          ),
        ),

        // SizedBox(height: ),

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            webtoonDTO.webtoonSpeciallyEnum == "휴재"
                ? Row(
                    children: [
                      TitleTag(titleTagEnum: TitleTagEnum.stop),
                      SizedBox(width: 2),
                      Container(
                        constraints: BoxConstraints(maxWidth: sizeGetScreenWidth(context) * 0.235),
                        child: Text("${webtoonDTO.title}", style: Theme.of(context).textTheme.displayMedium, overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  )
                : webtoonDTO.webtoonSpeciallyEnum == "완결"
                    ? Row(
                        children: [
                          TitleTag(titleTagEnum: TitleTagEnum.end),
                          SizedBox(width: 2),
                          Container(
                            constraints: BoxConstraints(maxWidth: sizeGetScreenWidth(context) * 0.235),
                            child: Text("${webtoonDTO.title}", style: Theme.of(context).textTheme.displayMedium, overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      )
                    : webtoonDTO.episodeUpdatedAt != null && todayDateTime.difference(webtoonDTO.episodeUpdatedAt!).inHours < 50
                        ? Row(
                            children: [
                              TitleTag(titleTagEnum: TitleTagEnum.up),
                              SizedBox(width: 2),
                              Container(
                                constraints: BoxConstraints(maxWidth: sizeGetScreenWidth(context) * 0.235),
                                child: Text("${webtoonDTO.title}", style: Theme.of(context).textTheme.displayMedium, overflow: TextOverflow.ellipsis),
                              ),
                            ],
                          )
                        : Container(
                            constraints: BoxConstraints(maxWidth: sizeGetScreenWidth(context) * 0.29),
                            child: Text("${webtoonDTO.title}", style: Theme.of(context).textTheme.displayMedium, overflow: TextOverflow.ellipsis),
                          ),
          ],
        ),
        Row(
          children: [
            Container(
                constraints: BoxConstraints(maxWidth: sizeGetScreenWidth(context) * 0.21),
                // child: Text("${webtoonDTO.authorNicknameList!.map((str) => str).toList().join('/').replaceAll(' ', '')} ",
                child: Text("${webtoonDTO.authorNicknameList!.toList().join('/').replaceAll(' ', '')} ",
                    style: Theme.of(context).textTheme.bodySmall, overflow: TextOverflow.ellipsis)),
            Container(
                child: Text("★ ${(webtoonDTO.starScore! / (webtoonDTO.starCount == 0 ? 1 : webtoonDTO.starCount!)).toStringAsFixed(2)}",
                    style: Theme.of(context).textTheme.bodySmall, maxLines: 1)),
          ],
        ),
      ],
    );
  }
}
