import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '_core/constants/move.dart';
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
      navigatorKey: navigatorKey, // context가 없는 곳에서 context를 사용할 수 있는 방법 (몰라도 됨)
      debugShowCheckedModeBanner: false,
      // initialRoute: Move.webtoonDetailPage, // 최초 화면
      initialRoute: Move.homeListPage, // 최초 화면
      routes: getRouters(),
      theme: theme(),
    );
  }
}
