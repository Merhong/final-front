import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/webtoon/list_page/webtoon_list_page.dart';

import '../../ui/pages/webtoon/detail_page/webtoon_detail_page.dart';

class Move {
  static String homeListPage = "/webtoon/home";
// static String webtoonDetailPage = "/webtoon/detail";
// detail페이지는 페이지마다 주소가 다르니까 못함
}

// Map<String, Widget Function(BuildContext)> 를 반환하는 함수
Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    Move.homeListPage: (context) => WebtoonListPage(),
    // Move.webtoonDetailPage: (context) => WebtoonDetailPage(),
  };
}
