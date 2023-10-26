import 'package:flutter/material.dart';
import 'package:flutter_blog/data/dto/episode_dto/episode_DTO.dart';
import 'package:flutter_blog/data/model/episode_photo.dart';
import 'package:flutter_blog/ui/pages/webtoon/episode_page/widgets/webtoon_episode_image.dart';

class WebtoonEpisodeBody extends StatelessWidget {
  EpisodeDTO episodeDTO;

  WebtoonEpisodeBody(this.episodeDTO);

  @override
  Widget build(BuildContext context) {
    return WebtoonEpisodeImage(episodeDTO);
  }
}
