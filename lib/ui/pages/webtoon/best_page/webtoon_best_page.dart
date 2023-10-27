import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/common_widgets/app_bottom.dart';
import 'package:flutter_blog/ui/pages/webtoon/best_page/wigets/best_nested_tab_bar.dart';

class WebtoonBestPage extends StatelessWidget {
  const WebtoonBestPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          title: Text('베스트도전'),
          actions: [Icon(Icons.search)],
          bottom: TabBar(
            dividerColor: Colors.transparent,
            tabs: <Widget>[
              Tab(text: '전체'),
              Tab(text: '순정'),
              Tab(text: '액션'),
              Tab(text: '스포츠'),
              Tab(text: '스릴러'),
              Tab(text: '판타지'),
              Tab(text: '드라마'),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            BestNestedTabBar('전체'),
            BestNestedTabBar('순정'),
            BestNestedTabBar('액션'),
            BestNestedTabBar('스포츠'),
            BestNestedTabBar('스릴러'),
            BestNestedTabBar('판타지'),
            BestNestedTabBar('드라마'),
          ],
        ),
        bottomNavigationBar: AppBottom(),
      ),
    );
  }
}
