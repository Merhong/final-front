import 'package:flutter/material.dart';
import 'package:flutter_blog/data/provider/param_provider.dart';
import 'package:flutter_blog/ui/common_widgets/app_bottom.dart';
import 'package:flutter_blog/ui/pages/webtoon/list_page/widgets/webtoon_list_pageview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecommendPageView extends ConsumerWidget {
  const RecommendPageView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () {
        ParamStore ps = ref.read(paramProvider);
        onItemTapped(0, context, ps);
        // ps.addBottomNavigationBarIndex(0);
        return Future.value(false);
      },
      child: SliverAppBar(
        // title: InkWell(onTap: () {}, child: Text("인기순", style: TextStyle(fontSize: 30))),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        title: Container(
          alignment: Alignment.topLeft,
          child: Text(
            "추천완결",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(Icons.search, color: Colors.black),
          )
        ],
        pinned: true,
        expandedHeight: 210,
        flexibleSpace: FlexibleSpaceBar(
          background: InkWell(
            onTap: () {
              print("페이지뷰클릭");
            },
            child: WebtoonListPageView(),
          ),
        ),
      ),
    );
  }
}
