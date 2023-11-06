import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/webtoon/episode_page/webtoon_episode_rating_star_view_model.dart';
import 'package:flutter_blog/ui/pages/webtoon/episode_page/widgets/webtoon_episode_rating_star_inkwell.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class RatingStarAlert extends ConsumerWidget {
  const RatingStarAlert({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WebtoonEpisodeRatingStarModel model = ref.watch(webtoonEpisodeRatingStarProvider);

    int? rating = model.ratingStarDTO?.episodeStarScore;
    Logger().d("디버그1", rating);

    return RatingStarInkwell(ref: ref);
  }
}