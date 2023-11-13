import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/dto/webtoon_dto/end_recommend_DTO.dart';
import 'package:flutter_blog/ui/common_widgets/custom_preview_number.dart';
import 'package:flutter_blog/ui/common_widgets/custom_privew_image.dart';
import 'package:flutter_blog/ui/pages/webtoon/recommend_page/webtoon_recommend_view_model.dart';
import 'package:flutter_blog/ui/pages/webtoon/recommend_page/widgets/recommend_page_view.dart';
import 'package:flutter_blog/ui/pages/webtoon/recommend_page/widgets/webtoon_recommend_bottom_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WebtoonRecommendForm extends ConsumerWidget {
  const WebtoonRecommendForm({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    RecommendModel? model = ref.watch(recommendProvider);

    if (model == null) {
      return Center(child: CircularProgressIndicator());
    }
    List<EndRecommendationDTO> list = model!.recommendationList;
    return CustomScrollView(
      slivers: [
        RecommendPageView(),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            if (index == 0) {
              return Container(
                height: 50,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            // 최신순 버튼 눌렀을 때의 동작 추가
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text("최신순"),
                                Icon(Icons.arrow_drop_down),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            // 전체 장르 버튼 눌렀을 때의 동작 추가
                          },
                          child: Row(
                            children: [
                              Text("전체 장르"),
                              Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("총 50작품"),
                    ),
                  ],
                ),
              );
            } else {
              return Padding(
                padding: EdgeInsets.fromLTRB(
                    sizePaddingLR17, sizeM10, sizePaddingLR17, sizeM10),
                child: CustomPreviewNumber(index: index),
              );
            }
          }, childCount: 3),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: 3),
          sliver: SliverToBoxAdapter(
            child: Container(
              height: 50,
              color: Colors.white,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "인기 수직 상승!",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "이번 주 급 상승 TOP 10!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
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
              return CustomPrivewImage(index: index);
            },
            childCount: 1,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Padding(
                padding: EdgeInsets.fromLTRB(
                    sizePaddingLR17, sizeM10, sizePaddingLR17, sizeM10),
                child: WebtoonRecommendBotoomList(index: index),
              );
            },
            childCount: list.length,
          ),
        )
      ],
    );
  }
}
