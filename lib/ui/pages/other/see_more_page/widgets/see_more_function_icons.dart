import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/other/see_more_page/widgets/notice_page.dart';
import 'package:flutter_blog/ui/pages/other/see_more_page/widgets/setting_page.dart';
import 'package:flutter_blog/ui/pages/search/search_page.dart';

class FunctionIcons extends StatelessWidget {
  const FunctionIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: GridView.count(
          padding: EdgeInsets.all(10.0),
          crossAxisCount: 4,
          mainAxisSpacing: 0.5,
          crossAxisSpacing: 0.5,
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SearchPage(),
                  ),
                );
              },
              child: SeeMoreIcons(Icons.search, "검색"),
            ),
            SeeMoreIcons(Icons.apple_sharp, "쿠키오븐"),
            SeeMoreIcons(Icons.gamepad_rounded, "쿠키미션"),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => NoticePage(),
                  ),
                );
              },
              child: SeeMoreIcons(Icons.speaker, "공지사항"),
            ),
            SeeMoreIcons(CupertinoIcons.smiley, "겟짤"),
            SeeMoreIcons(CupertinoIcons.game_controller, "play"),
            SeeMoreIcons(CupertinoIcons.bag, "스토어"),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SettingPage(),
                  ),
                );
              },
              child: SeeMoreIcons(Icons.settings, "설정"),
            ),
            SeeMoreIcons(Icons.filter, "폰필터"),
            SeeMoreIcons(Icons.energy_savings_leaf, "웹툰 운세"),
            SeeMoreIcons(Icons.cookie_sharp, "내가 만든 쿠키"),
            SeeMoreIcons(CupertinoIcons.heart_fill, "툰BTI"),
          ]),
    );
  }

  Widget SeeMoreIcons(IconData icon, String function) {
    return Column(
      children: [Icon(icon), Text(function)],
    );
  }
}
