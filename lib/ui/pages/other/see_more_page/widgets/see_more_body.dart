import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/other/see_more_page/widgets/cookie_advertising.dart';
import 'package:flutter_blog/ui/pages/other/see_more_page/widgets/see_more_function_icons.dart';
import 'package:flutter_blog/ui/pages/other/see_more_page/widgets/see_more_user_cookie.dart';
import 'package:flutter_blog/ui/pages/other/see_more_page/widgets/see_more_user_info.dart';

class SeeMoreBody extends StatelessWidget {
  const SeeMoreBody({Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SeeMoreUserInfo(),
        SeeMoreUserCookie(),
        FunctionIcons(),
        SizedBox(height: 90),
        Expanded(child: CookieAdvertising())
      ],
    );
  }
}
