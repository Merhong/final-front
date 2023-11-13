import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/my_color.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/common_widgets/custom_best_view.dart';
import 'package:flutter_blog/ui/pages/webtoon/best_page/widgets/dot_tab.dart';

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
          indicatorColor: Colors.white,
          labelColor: CommonColors.green, // 선택된 탭의 텍스트 색상
          unselectedLabelColor: Colors.black, // 선택되지 않은 탭의 텍스트 색상
          tabs: <Widget>[
            Tab(text: '업데이트순'),
            DotTab(text: '조회순'),
            DotTab(text: '별점순'),
            DotTab(text: '제목순'),
          ],
        ),
        Expanded(
            child: TabBarView(
          controller: _tabController,
          children: <Widget>[
            //TODO 미완성
            //TODO 미완성
            Padding(
              padding: EdgeInsets.fromLTRB(
                  sizePaddingLR17, sizeM10, sizePaddingLR17, sizeM10),
              child: CustomBestView(index: 0),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  sizePaddingLR17, sizeM10, sizePaddingLR17, sizeM10),
              child: CustomBestView(index: 1),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  sizePaddingLR17, sizeM10, sizePaddingLR17, sizeM10),
              child: CustomBestView(index: 2),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  sizePaddingLR17, sizeM10, sizePaddingLR17, sizeM10),
              child: CustomBestView(index: 3),
            ),
          ],
        )),
      ],
    );
  }
}
