import 'package:flutter/material.dart';
import 'package:flutter_blog/data/dto/user_dto/interest_webtoon_DTO.dart';
import 'package:flutter_blog/ui/common_widgets/myapp_appbar.dart';
import 'package:flutter_blog/ui/pages/other/my_page/my_interest_webtoon_view_model.dart';
import 'package:flutter_blog/ui/pages/other/my_page/wigets/my_tab_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyBodyTabBar extends StatefulWidget {
  @override
  _MyBodyTabBarState createState() => _MyBodyTabBarState();
}

class _MyBodyTabBarState extends State<MyBodyTabBar> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      body: MyTabBar(tabController: _tabController),
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                MyappAppbar(),
              ],
            ),
          ),
        ];
      },
    );

    // MyTabBar(tabController: _tabController);
  }
}
