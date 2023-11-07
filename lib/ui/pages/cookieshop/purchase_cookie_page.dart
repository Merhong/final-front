import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/cookieshop/widgets/purchase_cookie_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PurchaseCookie extends ConsumerWidget {
  // provider watch여야 함
  const PurchaseCookie({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(
        children: [
          Text(
            '일반패키지',
            style: TextStyle(fontSize: 18),
          ),
          PurchaseCookieBar(cookieCount: '10개', price: '1000'),
          PurchaseCookieBar(cookieCount: '30개', price: '3600'),
          PurchaseCookieBar(cookieCount: '50개', price: '6000'),
          PurchaseCookieBar(cookieCount: '100개', price: '12000'),
          PurchaseCookieBar(cookieCount: '200개', price: '24000'),
        ],
      ),
    );
  }
}
