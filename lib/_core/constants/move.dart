import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/auth/login_page/autor_login_page.dart';
import 'package:flutter_blog/ui/pages/auth/logout_page/logout_page.dart';
import 'package:flutter_blog/ui/pages/auth/terms_page/terms_page.dart';
import 'package:flutter_blog/ui/pages/cookieshop/cookieshop_page.dart';
import 'package:flutter_blog/ui/pages/other/my_page/my_page.dart';
import 'package:flutter_blog/ui/pages/other/see_more_page/see_more_page.dart';
import 'package:flutter_blog/ui/pages/pay/home_page/pay_home_page.dart';
import 'package:flutter_blog/ui/pages/pay/pay_card_page/pay_card_page.dart';
import 'package:flutter_blog/ui/pages/pay/pay_method_page/pay_method_page.dart';
import 'package:flutter_blog/ui/pages/search/search_page.dart';
import 'package:flutter_blog/ui/pages/webtoon/best_page/webtoon_best_page.dart';
import 'package:flutter_blog/ui/pages/webtoon/list_page/webtoon_list_page.dart';
import 'package:flutter_blog/ui/pages/webtoon/recommend_page/webtoon_recommend_page.dart';
import 'package:flutter_blog/ui/pages/webtoon/reply_page/webtoon_reply_page.dart';

import '../../ui/pages/auth/join_page/join_page.dart';
import '../../ui/pages/auth/login_page/login_page.dart';

class Move {
// static String webtoonDetailPage = "/webtoon/detail";
  static String episodePage = "/webtoon/episode";

// detail페이지는 페이지마다 주소가 다르니까 못함

  static String homeListPage = "/webtoons/home"; // 홈페이지
  static String loginPage = "/login"; // 로그인 페이지
  static String autoLoginPage = "/autoLogin"; // 자동로그인 페이지
  static String joinPage = "/join"; // 회원가입 페이지
  static String logoutPage = "/logout"; // 로그아웃 페이지
  static String termsPage = "/terms"; // 약관페이지(테스트용)
  static String cookieShop = "/cookieShop"; // 쿠키샵
  static String replyPage = "/webtoons/reply"; // 댓글쓰기(테스트용)
  static String recommendPage = "/weboons/recommend"; // 추천완결
  static String seeMorePage = "/seemore"; // 더보기
  static String myPage = "/my"; // MY
  static String bestPage = "/best"; // 베스트도전
  static String payHomePage = "/pay/home"; // 메인결제
  static String payMethodPage = "/pay/method"; // 결제(카드)
  static String payCardPage = "/pay/card"; // 결제(카드)
  static String searchPage = "/search"; // 결제(카드)
}

// Map<String, Widget Function(BuildContext)> 를 반환하는 함수
Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    // Move.webtoonDetailPage: (context) => WebtoonDetailPage(),
    // Move.episodePage: (context) => WebtoonEpisodePage(),
    Move.homeListPage: (context) => WebtoonListPage(),
    // Move.homeListPage: (context) => episodePage(),
    Move.loginPage: (context) => LoginPage(),
    Move.autoLoginPage: (context) => AutoLoginPage(),
    Move.joinPage: (context) => const JoinPage(),
    Move.logoutPage: (context) => LogoutPage(),
    Move.termsPage: (context) => TermsPage(),
    Move.cookieShop: (context) => CookieShop(),
    Move.replyPage: (context) => ReplyPage(),
    Move.recommendPage: (context) => WebtoonRecommendPage(),
    Move.seeMorePage: (context) => SeeMorePage(),
    Move.myPage: (context) => MyPage(),
    Move.bestPage: (context) => BestPage(),
    Move.payHomePage: (context) => PayHomePage(),
    Move.payMethodPage: (context) => PayMethodPage(),
    Move.payCardPage: (context) => PayCardPage(),
    Move.searchPage: (context) => SearchPage(),
  };
}
