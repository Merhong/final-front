import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/common_widgets/advertising.dart';
import 'package:flutter_blog/ui/pages/other/see_more_page/widgets/see_more_function_icons.dart';
import 'package:flutter_blog/ui/pages/other/see_more_page/widgets/see_more_user_cookie.dart';
import 'package:flutter_blog/ui/pages/other/see_more_page/widgets/see_more_user_info.dart';

class SeeMoreBody extends StatelessWidget {
  const SeeMoreBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SeeMoreUserInfo(),
        SeeMoreUserCookie(),
        FunctionIcons(),
        Container(height: 70.0),
        Advertising(
          ADHeight: sizeXXL100,
          ADImg: "${imageURL}default_AD.jpg",
        )
      ],
    );
  }
}
