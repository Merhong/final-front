import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';

class WebtoonDetailPreview extends StatelessWidget {
  const WebtoonDetailPreview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(color: Colors.black26),
        Padding(
          padding: const EdgeInsets.only(
            left: sizePaddingLR17,
            right: sizePaddingLR17,
          ),
          child: Row(
            children: [
              Text(
                '5개의 ',
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
                            child: Image.asset(
                              'assets/default_episode_Thumbnail.jpg', // 이미지 경로 지정
                              width: 60, // 이미지 너비를 아이콘 크기와 동일하게 설정
                              height: 60, // 이미지 높이를 아이콘 크기와 동일하게 설정
                              fit: BoxFit.cover, // 이미지를 동그라미에 꽉 채우도록 설정
                            ),
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
                            child: Image.asset(
                              'assets/default_episode_Thumbnail.jpg', // 이미지 경로 지정
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
                          child: Image.asset(
                            'assets/default_episode_Thumbnail.jpg', // 이미지 경로 지정
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
        Divider(color: Colors.black26),
      ],
    );
  }
}
