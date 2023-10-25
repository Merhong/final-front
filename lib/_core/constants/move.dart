import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/auth/terms_page/terms_page.dart';
import 'package:flutter_blog/ui/pages/webtoon/episode_page/webtoon_episode_page.dart';
import 'package:flutter_blog/ui/pages/webtoon/list_page/webtoon_list_page.dart';

import '../../ui/pages/auth/join_page/join_page.dart';
import '../../ui/pages/auth/login_page/login_page.dart';

class Move {
// static String webtoonDetailPage = "/webtoon/detail";
// static String episodePage = "/webtoon/episode";
// detail페이지는 페이지마다 주소가 다르니까 못함
  static String homeListPage = "/webtoons/home";
  static String loginPage = "/login";
  static String joinPage = "/join";
  static String termsPage = "/terms";
}

// Map<String, Widget Function(BuildContext)> 를 반환하는 함수
Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    // Move.webtoonDetailPage: (context) => WebtoonDetailPage(),
    // Move.episodePage: (context) => WebtoonEpisodePage(),
    Move.homeListPage: (context) => WebtoonListPage(),
    Move.loginPage: (context) => LoginPage(),
    Move.joinPage: (context) => const JoinPage(),
    Move.termsPage: (context) => TermsPage(),
  };
}
