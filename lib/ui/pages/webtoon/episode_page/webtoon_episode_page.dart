import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/webtoon/episode_page/widgets/webtoon_episode_bottom_bar.dart';
import 'package:flutter_blog/ui/pages/webtoon/episode_page/widgets/webtoon_episode_image.dart';

import 'widgets/webtoon_episode_app_bar.dart';

void main() {
  runApp(WebtoonApp());
}

class WebtoonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WebtoonEpisodePage(),
    );
  }
}

class WebtoonEpisodePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WebtoonEpisodeAppBar(),
      body: WebtoonEpisodeImage(),
      bottomNavigationBar: WebtoonEpisodeBottomBar(),
    );
  }
}
