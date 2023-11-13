import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/common_widgets/app_bottom.dart';
import 'package:flutter_blog/ui/pages/webtoon/recommend_page/widgets/webtoon_recommend_form.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WebtoonRecommendPage extends ConsumerStatefulWidget {
  @override
  _WebtoonRecommendPageState createState() => _WebtoonRecommendPageState();
}

class _WebtoonRecommendPageState extends ConsumerState<WebtoonRecommendPage> {
  // final scaffoldKey = GlobalKey<ScaffoldState>();
  final refreshKey = GlobalKey<RefreshIndicatorState>();

  final ScrollController recommendPageController = ScrollController();
  bool isScroll = false;

  @override
  void initState() {
    recommendPageController.addListener(() {
      // print("offset : ${detailPageController.offset}");
      if (recommendPageController.offset >= 130 && isScroll == false) {
        print("스크롤 감지");
        isScroll = true;
        setState(() {});
      } else if (recommendPageController.offset < 130 && isScroll == true) {
        print("스크롤 처음");
        isScroll = false;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebtoonRecommendBody(recommendPageController, isScroll),
      bottomNavigationBar: AppBottom(),
    );
  }
}
