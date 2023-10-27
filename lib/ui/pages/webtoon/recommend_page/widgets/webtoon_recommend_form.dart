import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/webtoon/recommend_page/webtoon_recommend_view_model.dart';
import 'package:flutter_blog/ui/pages/webtoon/recommend_page/widgets/webtoon_middle_list.dart';
import 'package:flutter_blog/ui/pages/webtoon/recommend_page/widgets/webtoon_recommend_bottom_list.dart';
import 'package:flutter_blog/ui/pages/webtoon/recommend_page/widgets/webtoon_recommend_middle_bar.dart';
import 'package:flutter_blog/ui/pages/webtoon/recommend_page/widgets/webtoon_recommend_middle_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WebtoonRecommendForm extends ConsumerWidget {
  const WebtoonRecommendForm({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WebtoonRecommendModel? model = ref.watch(recommendProvider);
    if (model == null) {
      return Center(child: CircularProgressIndicator());
    }

    return Padding(
      padding: const EdgeInsets.only(left: 3),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: 200,
              color: Colors.black,
            ),
          ),
          // SliverPadding(
          //   padding: const EdgeInsets.only(top: 0),
          //   sliver: SliverToBoxAdapter(
          //     child: Container(
          //       height: 50,
          //       color: Colors.grey,
          //       child: Center(
          //         child: Row(
          //           mainAxisAlignment:
          //               MainAxisAlignment.center, // 텍스트를 수직 중앙에 정렬
          //           children: [
          //             Text(
          //               "머홍 님,",
          //               style: TextStyle(
          //                 fontWeight: FontWeight.bold, // 첫 번째 텍스트 굵게 표시
          //                 fontSize: 20, // 원하는 글꼴 크기로 설정
          //               ),
          //             ),
          //             Text(
          //               "무료 대여권이 생겼어요!",
          //               style: TextStyle(
          //                 fontWeight: FontWeight.w400, // 두 번째 텍스트 굵게 표시
          //                 fontSize: 20, // 원하는 글꼴 크기로 설정
          //               ),
          //             ),
          //             Icon(Icons.downloading_rounded)
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // SliverList(
          //   delegate: SliverChildBuilderDelegate(
          //     (context, index) {
          //       return WebtoonCircleList();
          //     },
          //     childCount: 1,
          //   ),
          // ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return WebtoonRecommendMiddleBar(
                    allEnded: model!.webtoonRecommendationList.length);
              },
              childCount: 1, // 1로 설정하면 1개의 자식 위젯을 생성합니다.
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return WebtoonRecommendMiddleImage();
              },
              childCount: 2, // 1로 설정하면 1개의 자식 위젯을 생성합니다.
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 3),
            sliver: SliverToBoxAdapter(
              child: Container(
                height: 50,
                color: Colors.grey,
                child: Center(
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // 텍스트를 수직 중앙에 정렬
                    children: [
                      Text(
                        "인기 수직 상승!",
                        style: TextStyle(
                          fontWeight: FontWeight.w400, // 첫 번째 텍스트 굵게 표시
                          fontSize: 20, // 원하는 글꼴 크기로 설정
                        ),
                      ),
                      Text(
                        "이번 주 급 상승 TOP 10!",
                        style: TextStyle(
                          fontWeight: FontWeight.bold, // 두 번째 텍스트 굵게 표시
                          fontSize: 20, // 원하는 글꼴 크기로 설정
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return WebtoonMiddleList();
              },
              childCount: 1,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return WebtoonRecommendBotoomList();
              },
            ),
          )
        ],
      ),
    );
  }
}
