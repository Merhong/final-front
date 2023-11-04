import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/common_widgets/app_bottom.dart';
import 'package:flutter_blog/ui/pages/webtoon/recommend_page/widgets/webtoon_recommend_body.dart';

class WebtoonRecommendPage extends StatelessWidget {
  const WebtoonRecommendPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebtoonRecommendBody(),
      bottomNavigationBar: AppBottom(),
    );
  }
}
