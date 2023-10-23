import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/auth/login_page/login_page.dart';
import 'package:flutter_blog/ui/pages/webtoon/list_page/webtoon_list_page.dart';

class Move {
  static String homeListPage = "/webtoon/home";
  static String LoginPage = "/webtoon/login";
// static String webtoonDetailPage = "/webtoon/detail";
// detail페이지는 페이지마다 주소가 다르니까 못함
}

// Map<String, Widget Function(BuildContext)> 를 반환하는 함수
Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    Move.homeListPage: (context) => WebtoonListPage(),
    Move.LoginPage: (context) => LoginPage(),

    // Move.webtoonDetailPage: (context) => WebtoonDetailPage(),
  };
}
