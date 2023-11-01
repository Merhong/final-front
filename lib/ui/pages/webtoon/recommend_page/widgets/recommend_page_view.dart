import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/webtoon/list_page/widgets/webtoon_list_pageview.dart';

class RecommendPageView extends StatelessWidget {
  const RecommendPageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      // title: InkWell(onTap: () {}, child: Text("인기순", style: TextStyle(fontSize: 30))),
      centerTitle: true,
      leading: Text(
        "추천완결",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
      actions: [Icon(Icons.search, size: 20)],
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
    );
  }
}
