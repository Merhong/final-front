import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/webtoon_dto/end_recommend_DTO.dart';
import 'package:flutter_blog/ui/pages/webtoon/recommend_page/webtoon_recommend_view_model.dart';
import 'package:flutter_blog/ui/pages/webtoon/recommend_page/widgets/bottom_detail.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WebtoonRecommendBotoomList extends ConsumerWidget {
  const WebtoonRecommendBotoomList({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    RecommendModel? model = ref.watch(recommendProvider);

    if (model == null) {
      return Center(child: CircularProgressIndicator());
    }
    List<EndRecommendationDTO> list = model!.recommendationList;

    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: Container(
          height: 120,
          color: Colors.white,
          child: Row(
            children: [
              // 왼쪽에 이미지를 배치
              Image.network(
                "${imageURL}/WebtoonThumbnail/${list[index].image}",
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    "assets/default_webtoon_Thumbnail.jpg",
                    fit: BoxFit.cover,
                  );
                },
              ),
              // 요소 사이의 간격 조정
              // 오른쪽에 텍스트를 배치
              Expanded(
                child: BottomDetail(list: list, index: index),
              ),
            ],
          )),
    );
  }
}
