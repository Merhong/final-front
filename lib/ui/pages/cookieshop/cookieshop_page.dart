import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/cookieshop/widgets/cookieshop_appbar.dart';
import 'package:flutter_blog/ui/pages/cookieshop/widgets/cookieshop_tabbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CookieShop extends ConsumerWidget {
  const CookieShop({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: cookieAppBar(),
      body: CookieShopTab(),
    );
  }
}
