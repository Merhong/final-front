import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/data/provider/param_provider.dart';
import 'package:flutter_blog/ui/common_widgets/app_bottom.dart';
import 'package:flutter_blog/ui/pages/other/see_more_page/widgets/see_more_body.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SeeMorePage extends ConsumerWidget {
  const SeeMorePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () {
        ParamStore ps = ref.read(paramProvider);
        onItemTapped(0, context, ps);
        // ps.addBottomNavigationBarIndex(0);
        return Future.value(false);
      },
      child: Scaffold(
        bottomNavigationBar: AppBottom(),
        appBar: SeeMoreAppBar(),
        body: SeeMoreBody(),
      ),
    );
  }
}

AppBar SeeMoreAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 1,
    title: Text(
      '더보기',
      style: TextStyle(color: Colors.black),
    ), // AppBar의 제목을 설정
    centerTitle: true, // 제목을 가운데 정렬
  );
}
