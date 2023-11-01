import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/common_widgets/custom_best_view.dart';

class BestNestedTabBar extends StatefulWidget {
  const BestNestedTabBar(
    this.outerTab, {
    Key? key,
  });

  final String outerTab;

  @override
  State<BestNestedTabBar> createState() => _BestNestedTabBarState();
}

class _BestNestedTabBarState extends State<BestNestedTabBar>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    // length = 탭의 항목 수
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TabBar.secondary(
          controller: _tabController,
          labelColor: Colors.blue, // 선택된 탭의 텍스트 색상
          unselectedLabelColor: Colors.black, // 선택되지 않은 탭의 텍스트 색상
          tabs: const <Widget>[
            Tab(text: '업데이트순'),
            Tab(text: '조회순'),
            Tab(text: '별점순'),
            Tab(text: '제목순'),
          ],
        ),
        Expanded(
            child: TabBarView(
          controller: _tabController,
          children: <Widget>[
            //TODO 미완성
            CustomBestView(index: 0),
            CustomBestView(index: 1),
            CustomBestView(index: 2),
            CustomBestView(index: 3),
          ],
        )),
      ],
    );
  }
}
