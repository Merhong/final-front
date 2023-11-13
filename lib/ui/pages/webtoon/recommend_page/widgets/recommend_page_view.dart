import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/webtoon/list_page/widgets/webtoon_list_pageview.dart';
import 'package:flutter_blog/ui/pages/webtoon/recommend_page/widgets/recommend_drop_down.dart';

class RecommendPageView extends StatelessWidget {
  final bool isScroll;

  const RecommendPageView({
    Key? key,
    required this.isScroll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: Text(
        "추천완결",
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
      title: Container(
          width: 110, child: isScroll ? RecommendDropdown() : SizedBox()),
      backgroundColor: Colors.white,
      actions: [
        IconButton(
          icon: Icon(Icons.search, size: 20, color: Colors.white),
          onPressed: () {
            // Add the search functionality here
          },
        ),
      ],
      pinned: true,
      expandedHeight: 150,
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
