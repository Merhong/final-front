import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/webtoon/list_page/webtoon_list_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '_core/constants/theme.dart';
import 'ui/pages/webtoon/episode_page/webtoon_episode_page.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      // context가 없는 곳에서 context를 사용할 수 있는 방법 (몰라도 됨)
      debugShowCheckedModeBanner: false,

      // 최초 화면
      initialRoute: '/home_list',
      // 라우트 이름을 '/webtoon_episode'로 변경
      routes: {
        '/webtoon_episode': (context) => WebtoonEpisodePage(), // 새로운 라우트 추가
        '/home_list': (context) => WebtoonListPage(),
        // 다른 라우트들도 필요하다면 여기에 추가
      },

      // initialRoute: Move.EpisodePage(),
      // routes: getRouters(),

      theme: theme(),
    );
  }
}
