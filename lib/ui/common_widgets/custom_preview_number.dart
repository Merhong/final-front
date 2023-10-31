import 'package:flutter/material.dart';
import 'package:flutter_blog/data/dto/webtoon_dto/end_recommend_DTO.dart';
import 'package:flutter_blog/ui/pages/webtoon/list_page/webtoon_list_view_model.dart';
import 'package:flutter_blog/ui/pages/webtoon/recommend_page/webtoon_recommend_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class CustomPreviewNumber extends ConsumerWidget {
  const CustomPreviewNumber({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    RecommendModel? model = ref.watch(recommendProvider);

    if (model == null) {
      return Center(child: CircularProgressIndicator());
    }
    List<EndRecommendationDTO> list = model!.recommendationList;
    Logger().d(list[1].title);
    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: Container(
        height: 120,
        color: Colors.grey,
        child: Row(
          children: [
            Image.asset('assets/default_episode_Thumbnail.jpg'), // 이미지 추가
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    list[1].title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold, // 텍스트를 두꺼운 스타일로 설정
                    ),
                  ),
                  Text("이연"),
                  Text("세상에 이런 장르는 없다"),
                  Text(list[1].intro),
                  SizedBox(height: 5),
                  Text("${list[1].episodeCount}"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
