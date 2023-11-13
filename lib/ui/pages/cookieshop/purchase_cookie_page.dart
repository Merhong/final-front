import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/cookieshop/widgets/purchase_cookie_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PurchaseCookie extends ConsumerWidget {
  const PurchaseCookie({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 13),
          child: Text(
            '일반패키지',
            style: TextStyle(fontSize: 18),
          ),
        ),
        PurchaseCookieBar(cookieCount: '10', price: '1000'),
        Divider(color: Colors.black26, height: 1, thickness: 1),
        PurchaseCookieBar(cookieCount: '30', price: '3600'),
        Divider(color: Colors.black26, height: 1, thickness: 1),
        PurchaseCookieBar(cookieCount: '50', price: '6000'),
        Divider(color: Colors.black26, height: 1, thickness: 1),
        PurchaseCookieBar(cookieCount: '100', price: '12000'),
        Divider(color: Colors.black26, height: 1, thickness: 1),
        PurchaseCookieBar(cookieCount: '200', price: '24000'),
        Divider(color: Colors.black26, height: 1, thickness: 1),
        PurchaseCookieBar(cookieCount: '300', price: '36000'),
      ],
    );
  }
}
