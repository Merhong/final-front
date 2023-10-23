import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/webtoon/list_page/widgets/webtoon_list_pageview.dart';

class WebtoonListSliverAppBarAndPageView extends StatelessWidget {
  const WebtoonListSliverAppBarAndPageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      // title: InkWell(onTap: () {}, child: Text("인기순", style: TextStyle(fontSize: 30))),
      centerTitle: true,
      leading: Icon(Icons.cookie, size: 40, color: Colors.orange),
      actions: [
        Padding(padding: EdgeInsets.all(5.0), child: Icon(Icons.search, size: 40)),
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
    );
  }
}
