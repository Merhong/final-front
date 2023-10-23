import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../_core/constants/size.dart';
import '../../../../../data/model/webtoon.dart';

class WebtoonDetailEpisode extends StatelessWidget {
  WebtoonDetailEpisode({
    super.key,
    required this.webtoon,
    required this.index,
  });

  final int index;
  final Webtoon webtoon;
  final DateFormat dateFormat = DateFormat("yyyy-MM-dd");

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("클릭");
      },
      child: Column(
        children: [
          Divider(height: 1, color: Colors.grey),
          Padding(
            padding: EdgeInsets.fromLTRB(sizePaddingLR17, sizeS5, sizePaddingLR17, sizeS5),
            child: Row(
              children: [
                SizedBox(
                  width: sizeGetScreenWidth(context) * 0.25,
                  height: sizeXL50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(sizeBorder5),
                    child: Image.asset(
                      'assets/EpisodeThumbnail/${webtoon.episodeList![index].thumbnail}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: sizeM10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${webtoon.episodeList![index].detailTitle}"),
                    Row(
                      children: [
                        Text("★${webtoon.episodeList![index].starCount}   ${dateFormat.format(webtoon.episodeList![index].createdAt)}",
                            style: TextStyle(fontSize: 10, color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
