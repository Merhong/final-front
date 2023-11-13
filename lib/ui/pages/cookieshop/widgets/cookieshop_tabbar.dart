import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/my_color.dart';
import 'package:flutter_blog/ui/common_widgets/bottom_rule.dart';
import 'package:flutter_blog/ui/pages/cookieshop/payment_history/payment_history_page.dart';
import 'package:flutter_blog/ui/pages/cookieshop/purchase_cookie_page.dart';
import 'package:flutter_blog/ui/pages/cookieshop/used_history_page.dart';
import 'package:flutter_blog/ui/pages/cookieshop/widgets/current_cookie.dart';

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
    super.initState();
    _tabController = new TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTabBar(),
        CurrentCookie(),
        Expanded(
          child: _buildTabBarView(),
        ),
        BottomRule(), // BottomRule 추가
      ],
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      unselectedLabelColor: Colors.black,
      labelColor: CommonColors.green,
      controller: _tabController,
      indicatorColor: CommonColors.green,
      tabs: const [
        Tab(
          text: "쿠키구매",
        ),
        Tab(
          text: "구매내역",
        ),
        Tab(
          text: "사용내역",
        ),
      ],
    );
  }

  Widget _buildTabBarView() {
    return TabBarView(
      controller: _tabController,
      children: <Widget>[PurchaseCookie(), PurchaseHistory(), UsedHistory()],
    );
  }
}
