import 'package:flutter/material.dart';
import 'package:flutter_blog/data/dto/recommend_dto/end_recommendation_DTO.dart';
import 'package:flutter_blog/ui/pages/webtoon/recommend_page/webtoon_recommend_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomPreviewNumber extends ConsumerWidget {
  const CustomPreviewNumber({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    RecommendModel? model = ref.read(recommendProvider);

    if (model == null) {
      return Center(child: CircularProgressIndicator());
    }

    List<EndRecommendationDTO> DTOList = model!.recommendationList!;

    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: Container(
        height: 120,
        color: Colors.grey,
        child: Row(
          children: [
            Image.asset(""), // 이미지 추가
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    //여기에 DTOList[index].title 이런식으로 해주면 됨!!!
                    "",
                    style: TextStyle(
                      fontWeight: FontWeight.bold, // 텍스트를 두꺼운 스타일로 설정
                    ),
                  ),
                  Text("이연"),
                  Text("세상에 이런 장르는 없다"),
                  Text("핵폭탄급 아이돌 전쟁"),
                  SizedBox(height: 5),
                  Text("총 103화"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
