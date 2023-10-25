import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/webtoon/episode_page/widgets/webtoon_episode_bottom_bar.dart';
import 'package:flutter_blog/ui/pages/webtoon/reply_page/widgets/webtoon_episode_reply_app_bar.dart';
import 'package:flutter_blog/ui/pages/webtoon/reply_page/widgets/webtoon_episode_reply_body.dart';
import 'package:flutter_blog/ui/pages/webtoon/reply_page/widgets/wetoon_episode_reply_tab_bar.dart';

class WebtoonReplyPage extends StatelessWidget {
  WebtoonReplyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ReplyPage(),
    );
  }
}

class ReplyPage extends StatelessWidget {
  const ReplyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReplyAppBar(),
      body: Column(
        children: [
          ReplyTabBar(),
          WebtoonReplyBody(),
        ],
      ),
      bottomNavigationBar: WebtoonEpisodeBottomBar(),
    );
  }
}
