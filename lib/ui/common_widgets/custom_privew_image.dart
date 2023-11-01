import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/webtoon_dto/end_recommend_DTO.dart';
import 'package:flutter_blog/ui/pages/webtoon/recommend_page/webtoon_recommend_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomPrivewImage extends ConsumerWidget {
  const CustomPrivewImage({
    required this.index,
    super.key,
  });

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    RecommendModel? model = ref.watch(recommendProvider);
    if (model == null) {
      return Center(child: CircularProgressIndicator());
    }
    List<EndRecommendationDTO> list = model!.recommendationList;
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: Container(
        height: 200,
        color: Colors.white,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5, // 원하는 이미지 수로 변경
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: 150, // 이미지 너비 조정
              height: 250, // 이미지 높이 조정
              margin: EdgeInsets.only(right: 5),
              child: Column(
                children: [
                  Image.network(
                      "${imageURL}/WebtoonThumbnail/${list[index].image}",
                      fit: BoxFit.cover,
                      height: 150, errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      "assets/default_webtoon_Thumbnail.jpg",
                      fit: BoxFit.cover,
                    );
                  }),
                  Text(
                    list[index].title, // 첫 번째 텍스트 내용
                    style: TextStyle(
                      fontSize: 16, // 텍스트 크기 조정
                      fontWeight: FontWeight.bold, // 텍스트 스타일 조정
                    ),
                  ),
                  Text(
                    "${list[index].authorNicknameList}", // 두 번째 텍스트 내용
                    style: TextStyle(
                      fontSize: 14, // 텍스트 크기 조정
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
