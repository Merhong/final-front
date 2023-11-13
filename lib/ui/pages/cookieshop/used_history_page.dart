import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/cookieshop/widgets/use_cookie_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UsedHistory extends ConsumerWidget {
  const UsedHistory({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        UseCookieBar(
          cookie: '쿠키 2개',
          date: '23.10.29',
          page: '97화',
          title: '내가 죽기로 결심한 것은',
        ),
        Divider(color: Colors.black26, height: 1, thickness: 1),
        UseCookieBar(
          cookie: '쿠키 2개',
          date: '23.10.22',
          page: '50화',
          title: '사랑받는 시집살이',
        ),
        Divider(color: Colors.black26, height: 1, thickness: 1),
        UseCookieBar(
          cookie: '쿠키 2개',
          date: '23.5.31',
          page: '120화',
          title: '세기말 풋사과 보습학원',
        ),
        Divider(color: Colors.black26, height: 1, thickness: 1),
        UseCookieBar(
          cookie: '쿠키 2개',
          date: '23.11.08',
          page: '40화',
          title: '신혼일기',
        ),
        Divider(color: Colors.black26, height: 1, thickness: 1),
        UseCookieBar(
          cookie: '쿠키 2개',
          date: '23.08.16',
          page: '89화',
          title: '35cm',
        ),
        Divider(color: Colors.black26, height: 1, thickness: 1),
      ],
    );
  }
}
