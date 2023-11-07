import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/cookieshop/free_cookie_page.dart';
import 'package:flutter_blog/ui/pages/cookieshop/purchase_cookie_page.dart';
import 'package:flutter_blog/ui/pages/cookieshop/purchase_history_page.dart';
import 'package:flutter_blog/ui/pages/cookieshop/used_history_page.dart';

class CookieShopTab extends StatefulWidget {
  const CookieShopTab({super.key});

  @override
  _CookieShopTabState createState() => _CookieShopTabState();
}

class _CookieShopTabState extends State<CookieShopTab>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_buildTabBar(), Expanded(child: _buildTabBarView())],
    );
  }

  Widget _buildTabBar() {
    return TabBar(
        controller: _tabController,
        labelColor: Colors.black,
        indicatorColor: Colors.green,
        tabs: const [
          Tab(
            text: "쿠키구매",
          ),
          Tab(
            text: "구매내역",
          ),
          Tab(
            text: "무료쿠키",
          ),
          Tab(
            text: "사용내역",
          ),
        ]);
  }

  Widget _buildTabBarView() {
    return TabBarView(controller: _tabController, children: <Widget>[
      PurchaseCookie(),
      PurchaseHistory(),
      FreeCookie(),
      UsedHistory()
    ]);
  }
}
