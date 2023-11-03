import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/webtoon_DTO/detail_page_webtoon_DTO.dart';
import 'package:flutter_blog/data/model/author.dart';

import '../../../../../_core/constants/size.dart';
import '../../../../common_widgets/advertising.dart';
import '../../../../common_widgets/webtoon_hashtag.dart';

class WebtoonDetailDescription extends StatefulWidget {
  final DetailPageWebtoonDTO webtoonDTO;

  WebtoonDetailDescription(this.webtoonDTO);

  @override
  State<WebtoonDetailDescription> createState() => _WebtoonDetailDescriptionState();
}

class _WebtoonDetailDescriptionState extends State<WebtoonDetailDescription> {
  bool isScroll = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(sizePaddingLR17, sizeM10, sizePaddingLR17, sizeM10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${widget.webtoonDTO.title}", style: Theme.of(context).textTheme.displayLarge),
          buildAuthornameAndWeek(widget.webtoonDTO.authorList, widget.webtoonDTO.title),
          buildDescriptionButton(context),
          SizedBox(height: sizeS5),
          Advertising(),
        ],
      ),
    );
  }

  Column buildDescriptionButton(BuildContext context) {
    return Column(
      children: [
        isScroll == true
            ? Padding(
                padding: EdgeInsets.fromLTRB(0, 2, 0, 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: sizeGetScreenWidth(context) * 0.85,
                          child: Text(
                            "${widget.webtoonDTO.intro}",
                            style: TextStyle(fontSize: 13, color: Colors.grey[600]),
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
                    Row(
                      children: [
                        Text("연령 : ", style: TextStyle(color: Colors.grey[600])),
                        Text("${widget.webtoonDTO.ageLimit == 0 ? "전체 이용가" : "${widget.webtoonDTO.ageLimit}세 이용가"}"),
                      ],
                    ),
                    SizedBox(height: sizeS5),
                    Wrap(
                        // children: [
                        children: [
                          ...widget.webtoonDTO.hashTagList!
                              .map((hashTag) => HashTag(hashTagName: hashTag.hashTagName, hashTagEnum: hashTag.hashTagEnum))
                              .toList(),
                        ]
                        //   HashTag(hashTagName: "판타지"),
                        //   HashTag(hashTagName: "주간남성랭킹 TOP 10"),
                        //   HashTag(hashTagName: "판타지 무협랭킹 3위"),
                        //   HashTag(hashTagName: "고인물"),
                        //   HashTag(hashTagName: "레드아이스 스튜디오"),
                        //   HashTag(hashTagName: "사이다"),
                        //   HashTag(hashTagName: "게임판타지"),
                        //   HashTag(hashTagName: "헌터물"),
                        //   HashTag(hashTagName: "먼치킨"),
                        // ],

                        ),
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
                      width: sizeGetScreenWidth(context) * 0.85,
                      child: Text(
                        "${widget.webtoonDTO.intro}",
                        style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                        maxLines: 1,
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

  Row buildAuthornameAndWeek(List<Author> authorList, String webtoonTitle) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: RichText(
                    text: TextSpan(
                      text: "${webtoonTitle}",
                      style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                      children: [
                        // TextSpan(text: " 의", style: TextStyle(color: Colors.grey[600], fontSize: 14)),
                        TextSpan(text: " 작가", style: TextStyle(color: Colors.green, fontSize: 16)),
                      ],
                    ),
                  ),
                  content: Container(
                    height: 5 + authorList.length * 70,
                    child: Column(
                      children: [
                        for (Author author in authorList)
                          Column(
                            children: [
                              Divider(color: Colors.grey, height: 1, thickness: 1),
                              SizedBox(height: sizeS5),
                              InkWell(
                                onTap: () {
                                  print("${author.authorPhoto}/${author.authorNickname}");
                                  // TODO 작가페이지
                                },
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: NetworkImage("${imageURL}/AuthorPhoto/${author.authorPhoto}"),
                                      radius: 30,
                                    ),
                                    SizedBox(width: sizeM10),
                                    Text("${author.authorNickname}"),
                                    Spacer(),
                                    Text("> ", style: TextStyle(fontSize: 20, color: Colors.grey)),
                                  ],
                                ),
                              ),
                              SizedBox(height: sizeS5),
                            ],
                          ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: Row(
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: sizeGetScreenWidth(context) * 0.6),
                child: Text("${widget.webtoonDTO.authorList.map((author) => author.authorNickname).toList().join('/').replaceAll(' ', '')}",
                    overflow: TextOverflow.ellipsis),
              ),
              Text(" ✅")
            ],
          ),
        ),
        Text("  ·  "),
        widget.webtoonDTO.webtoonWeekDayEnum! == "월화수목금토일"
            ? Text("매일 연재")
            : Text("${widget.webtoonDTO.webtoonWeekDayEnum!.split("").join(", ")} 연재", overflow: TextOverflow.ellipsis),
      ],
    );
  }
}
