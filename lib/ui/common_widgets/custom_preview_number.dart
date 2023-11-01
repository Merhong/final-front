import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/webtoon_dto/end_recommend_DTO.dart';
import 'package:flutter_blog/ui/pages/webtoon/recommend_page/webtoon_recommend_view_model.dart';
import 'package:flutter_blog/ui/pages/webtoon/recommend_page/widgets/recommend_intro.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomPreviewNumber extends ConsumerWidget {
  const CustomPreviewNumber({required this.index});

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
        height: 150,
        color: Colors.white,
        child: Row(
          children: [
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    list[2].title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold, // 텍스트를 두꺼운 스타일로 설정
                    ),
                  ),
                  Text("${list[index].authorNicknameList}"),
                  Text("${list[index].title}"),
                  RecommendIntro(list: list, index: index),
                  SizedBox(height: 5),
                  Text("${list[index].episodeCount}"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
