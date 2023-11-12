import 'package:flutter/material.dart';
import 'package:flutter_blog/data/dto/episode_dto/episode_DTO.dart';
import 'package:flutter_blog/data/provider/param_provider.dart';
import 'package:flutter_blog/ui/pages/webtoon/episode_page/webtoon_episode_view_model.dart';
import 'package:flutter_blog/ui/pages/webtoon/episode_page/widgets/webtoon_episode_body.dart';
import 'package:flutter_blog/ui/pages/webtoon/episode_page/widgets/webtoon_episode_bottom_bar.dart';
import 'package:flutter_blog/ui/pages/webtoon/episode_page/widgets/webtoon_episode_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets/webtoon_episode_app_bar.dart';

class WebtoonEpisodePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ref.read(paramProvider).isEpisodeMove == true) {
      print("ref.read(paramProvider).isEpisodeMove : ${ref.read(paramProvider).isEpisodeMove}");
      ref.read(paramProvider).isEpisodeMove = false;
      ref.read(webtoonEpisodeProvider.notifier).notifyInit();
    }

    WebtoonEpisodeModel? model = ref.watch(webtoonEpisodeProvider);

    if (model == null) {
      return Center(child: CircularProgressIndicator());
    }

    EpisodeDTO episodeDTO = model.episodeDTO;

    // if (episodeDTO.episodeId != ref.read(paramProvider).episodeId) {
    //   ref.read(webtoonEpisodeProvider.notifier).notifyInit();
    // }

    return Scrollbar(
      trackVisibility: true,
      thumbVisibility: true,
      thickness: model.isClick == true ? 7 : 0,
      child: Scaffold(
        appBar: model.isClick == true
            ? WebtoonEpisodeAppBar(episodeDTO.detailTitle) //
            : AppBar(backgroundColor: Colors.black, toolbarHeight: 0),
        body: GestureDetector(
          onTap: () {
            ref.watch(webtoonEpisodeProvider.notifier).appBarHidden();
          },
          child: InteractiveViewer(
            // 에피소드 사진 확대 축소 (컨트롤 클릭해서 끌기)
            child: WebtoonEpisodeBody(episodeDTO),
          ),
        ),
        bottomNavigationBar: model.isClick == true ? WebtoonEpisodeBottomBar(episodeDTO: episodeDTO) : BottomAppBar(),
      ),
    );
  }
}
