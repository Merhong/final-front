import 'package:flutter/material.dart';
import 'package:flutter_blog/data/dto/episode_dto/episode_DTO.dart';
import 'package:flutter_blog/ui/pages/webtoon/episode_page/webtoon_episode_view_model.dart';
import 'package:flutter_blog/ui/pages/webtoon/episode_page/widgets/webtoon_episode_body.dart';
import 'package:flutter_blog/ui/pages/webtoon/episode_page/widgets/webtoon_episode_bottom_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets/webtoon_episode_app_bar.dart';

class WebtoonEpisodePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WebtoonEpisodeModel? model = ref.watch(webtoonEpisodeProvider);

    if (model == null) {
      return Center(child: CircularProgressIndicator());
    }

    EpisodeDTO episodeDTO = model!.episodeDTO;

    return Scaffold(
      appBar: WebtoonEpisodeAppBar(episodeDTO.detailTitle),
      body: WebtoonEpisodeBody(episodeDTO),
      bottomNavigationBar: WebtoonEpisodeBottomBar(episodeDTO: episodeDTO),
    );
  }
}
