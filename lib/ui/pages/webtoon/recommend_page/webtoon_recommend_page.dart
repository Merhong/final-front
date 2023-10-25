import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/common_widgets/app_bottom.dart';
import 'package:flutter_blog/ui/common_widgets/custom_bottom_title_appbar.dart';
import 'package:flutter_blog/ui/pages/webtoon/recommend_page/widgets/webtoon_recommend_body.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WebtoonRecommendPage(),
    );
  }
}

class WebtoonRecommendPage extends StatelessWidget {
  const WebtoonRecommendPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBottomTitleAppbar("추천완결"),
      body: WebtoonRecommendBody(),
      bottomNavigationBar: AppBottom(),
    );
  }
}
