import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/other/my_page/wigets/my_tab_bar.dart';

class MyBodyTabBar extends StatefulWidget {
  @override
  _MyBodyTabBarState createState() => _MyBodyTabBarState();
}

class _MyBodyTabBarState extends State<MyBodyTabBar>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return MyTabBar(tabController: _tabController);
  }
}
