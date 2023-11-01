import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/dto/webtoon_dto/end_recommend_DTO.dart';

class RecommendIntro extends StatefulWidget {
  const RecommendIntro({
    Key? key,
    required this.list,
    required this.index,
  }) : super(key: key);

  final List<EndRecommendationDTO> list;
  final int index;

  @override
  _RecommendIntroState createState() => _RecommendIntroState();
}

class _RecommendIntroState extends State<RecommendIntro> {
  bool isScroll = false; // isScroll 변수 정의 및 초기화

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildDescriptionButton(context),
      ],
    );
  }

  Column buildDescriptionButton(BuildContext context) {
    return Column(
      children: [
        isScroll == true
            ? Padding(
                padding: EdgeInsets.fromLTRB(0, 2, 0, 5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width:
                              sizeGetScreenWidth(context) * 0.5, // 예시로 0.6로 변경
                          child: Text(
                            "${widget.list[widget.index].intro}",
                            style: TextStyle(
                                fontSize: 13, color: Colors.grey[600]),
                            maxLines: 2, // 최대 세 줄까지 표시
                            overflow: TextOverflow
                                .ellipsis, // 텍스트가 세 줄을 넘어갈 경우 '...' 표시
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            isScroll = !isScroll;
                            setState(() {});
                          },
                          child: Icon(Icons.arrow_drop_up),
                        ),
                      ],
                    ),
                    SizedBox(height: sizeS5),
                  ],
                ),
              )
            : Padding(
                padding: EdgeInsets.fromLTRB(0, 2, 0, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: sizeGetScreenWidth(context) * 0.5, // 예시로 0.7로 변경
                      child: Text(
                        "${widget.list[widget.index].intro}",
                        style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        isScroll = !isScroll;
                        setState(() {});
                      },
                      child: Icon(Icons.arrow_drop_down),
                    ),
                  ],
                ),
              ),
      ],
    );
  }
}
