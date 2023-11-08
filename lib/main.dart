import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '_core/constants/theme.dart';

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

      //initialRoute: Move.cookieShop,
      // initialRoute: Move.searchPage,
      // initialRoute: Move.loginPage,

      initialRoute: Move.autoLoginPage,
      // initialRoute: Move.cookieShop,
      // initialRoute: Move.searchPage,
      // initialRoute: Move.loginPage,

      // initialRoute: Move.payHomePage,
      // initialRoute: Move.payMethodPage,
      // initialRoute: Move.payCardPage,

      // _core/move.dart 에 적어주세요
      routes: getRouters(),
      theme: theme(),
    );
  }
}
