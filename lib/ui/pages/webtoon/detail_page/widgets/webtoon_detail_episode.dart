import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/common_widgets/custom_detail_episode.dart';
import 'package:intl/intl.dart';

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
      child: CustomDetailEpisode(
          webtoon: webtoon, index: index, dateFormat: dateFormat),
    );
  }
}
