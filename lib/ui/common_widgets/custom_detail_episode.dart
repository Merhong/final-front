import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/model/webtoon.dart';
import 'package:intl/intl.dart';

class CustomDetailEpisode extends StatelessWidget {
  const CustomDetailEpisode({
    super.key,
    required this.webtoon,
    required this.index,
    required this.dateFormat,
  });

  final Webtoon webtoon;
  final int index;
  final DateFormat dateFormat;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(height: 1, color: Colors.grey),
        Padding(
          padding: EdgeInsets.fromLTRB(
              sizePaddingLR17, sizeS5, sizePaddingLR17, sizeS5),
          child: Row(
            children: [
              SizedBox(
                width: sizeGetScreenWidth(context) * 0.25,
                height: sizeXL50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(sizeBorder5),
                  child: Image.network(
                      '$imageURL/EpisodeThumbnail/${webtoon.episodeList![index].thumbnail}',
                      fit: BoxFit.cover,
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
                  Text("${webtoon.episodeList![index].detailTitle}"),
                  Row(
                    children: [
                      Text(
                          "★${webtoon.episodeList![index].starCount}   ${dateFormat.format(webtoon.episodeList![index].createdAt)}",
                          style: TextStyle(fontSize: 10, color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
