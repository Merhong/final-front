import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/auth/terms_page/terms_page.dart';
import 'package:flutter_blog/ui/pages/cookieshop/cookieshop_page.dart';
import 'package:flutter_blog/ui/pages/cookieshop/purchase_cookie_page.dart';
import 'package:flutter_blog/ui/pages/other/my_page/my_page.dart';
import 'package:flutter_blog/ui/pages/other/see_more_page/see_more_page.dart';
import 'package:flutter_blog/ui/pages/webtoon/best_page/webtoon_best_page.dart';
import 'package:flutter_blog/ui/pages/webtoon/episode_page/webtoon_episode_page.dart';

import 'package:flutter_blog/ui/pages/webtoon/list_page/webtoon_list_page.dart';
import 'package:flutter_blog/ui/pages/webtoon/recommend_page/webtoon_recommend_page.dart';
import 'package:flutter_blog/ui/pages/webtoon/reply_page/webtoon_reply_page.dart';
import 'package:flutter_blog/ui/pay/pay_page.dart';

import '../../ui/pages/auth/join_page/join_page.dart';
import '../../ui/pages/auth/login_page/login_page.dart';

class Move {
// static String webtoonDetailPage = "/webtoon/detail";
  static String episodePage = "/webtoon/episode";
// detail페이지는 페이지마다 주소가 다르니까 못함

  static String homeListPage = "/webtoons/home"; // 홈페이지
  static String loginPage = "/login"; // 로그인 페이지
  static String joinPage = "/join"; // 회원가입 페이지
  static String termsPage = "/terms"; // 약관페이지(테스트용)
  static String cookieShop = "/cookieShop"; // 쿠키샵
  static String replyPage = "/webtoons/reply"; // 댓글쓰기(테스트용)
  static String recommendPage = "/weboons/recommend"; // 추천완결
  static String seeMorePage = "/seemore"; // 더보기
  static String bestPage = "/best"; // 베스트페이지
  static String myPage = "/my";
  static String payPage = "/pay";
}

// Map<String, Widget Function(BuildContext)> 를 반환하는 함수
Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    // Move.webtoonDetailPage: (context) => WebtoonDetailPage(),
    // Move.episodePage: (context) => WebtoonEpisodePage(),
    Move.homeListPage: (context) => WebtoonListPage(),
    // Move.homeListPage: (context) => episodePage(),
    Move.loginPage: (context) => LoginPage(),
    Move.joinPage: (context) => const JoinPage(),
    Move.termsPage: (context) => TermsPage(),
    Move.cookieShop: (context) => CookieShop(),
    Move.replyPage: (context) => ReplyPage(),
    Move.recommendPage: (context) => WebtoonRecommendPage(),
    Move.seeMorePage: (context) => SeeMorePage(),
    Move.myPage: (context) => MyPage(),
    Move.payPage: (context) => PayPage(),
    Move.bestPage: (context) => BestPage(),
  };
}
