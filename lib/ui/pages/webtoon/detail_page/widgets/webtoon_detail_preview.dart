import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/dto/webtoon_DTO/detail_page_webtoon_DTO.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WebtoonDetailPreview extends ConsumerWidget {
  const WebtoonDetailPreview({
    required this.webtoonDTO,
    Key? key,
  }) : super(key: key);

  final DetailPageWebtoonDTO webtoonDTO;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Divider(color: Colors.grey, height: 1, thickness: 1),
        Padding(
          padding: const EdgeInsets.only(
              left: sizePaddingLR17,
              right: sizePaddingLR17,
              top: sizeS5,
              bottom: sizeS5),
          child: Row(
            children: [
              Text(
                '3개의 ',
                style: TextStyle(
                  color: Colors.green, // 초록색 텍스트
                  fontWeight: FontWeight.bold, // 글자 크기를 두꺼워지게 함
                ),
              ),
              Text(
                '미리보기가 있습니다',
                style: TextStyle(
                  fontWeight: FontWeight.bold, // 글자 크기를 두꺼워지게 함
                ),
              ),
              Spacer(),
              Expanded(
                child: Stack(
                  children: [
                    // 세 번째 그림 미리보기
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          // 그림 미리보기 배경색 설정
                          shape: BoxShape.circle,
                        ),
                        // 그림 미리보기 아이템 내용 설정 (이미지)
                        child: Center(
                          child: ClipOval(
                            child: Image.network(
                                '$imageURL/EpisodeThumbnail/${webtoonDTO.episodeList![1].thumbnail}',
                                fit: BoxFit.cover,
                                width: 60, // 이미지 너비를 아이콘 크기와 동일하게 설정
                                height: 55, // 이미지 높이를 아이콘 크기와 동일하게 설정
                                errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                "assets/default_episode_Thumbnail.jpg",
                                fit: BoxFit.cover,
                              );
                            }),
                          ),
                        ),
                      ),
                    ),

                    // 두 번째 그림 미리보기
                    Positioned(
                      top: 0, // 위쪽으로 이동
                      right: 20, // 오른쪽으로 이동
                      left: 20,
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        // 그림 미리보기 아이템 내용 설정 (이미지)
                        child: Center(
                          child: ClipOval(
                            child: Image.network(
                              '$imageURL/EpisodeThumbnail/${webtoonDTO.episodeList![2].thumbnail}',
                              width: 60, // 이미지 너비를 아이콘 크기와 동일하게 설정
                              height: 60, // 이미지 높이를 아이콘 크기와 동일하게 설정
                              fit: BoxFit.cover, // 이미지를 동그라미에 꽉 채우도록 설정
                            ),
                          ),
                        ),
                      ),
                    ),

                    // 첫 번째 그림 미리보기
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        // 그림 미리보기 배경색 설정
                        shape: BoxShape.circle,
                      ),
                      // 그림 미리보기 아이템 내용 설정 (이미지)
                      child: Center(
                        child: ClipOval(
                          child: Image.network(
                            '$imageURL/EpisodeThumbnail/${webtoonDTO.episodeList![3].thumbnail}',
                            width: 60, // 이미지 너비를 아이콘 크기와 동일하게 설정
                            height: 60, // 이미지 높이를 아이콘 크기와 동일하게 설정
                            fit: BoxFit.cover, // 이미지를 동그라미에 꽉 채우도록 설정
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
