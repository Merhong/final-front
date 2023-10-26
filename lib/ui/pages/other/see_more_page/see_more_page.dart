import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/common_widgets/app_bottom.dart';
import 'package:flutter_blog/ui/pages/other/see_more_page/widgets/see_more_body.dart';

class SeeMorePage extends StatelessWidget {
  const SeeMorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppBottom(),
      appBar: SeeMoreAppBar(),
      body: SeeMoreBody(),
    );
  }
}

AppBar SeeMoreAppBar() {
  return AppBar(
    leading: Row(
      children: [
        SizedBox(width: sizeM10),
        Text("더보기"),
      ],
    ),
  );
}
