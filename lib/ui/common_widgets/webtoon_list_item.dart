import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/webtoon_DTO/list_page_webtoon_DTO.dart';

import '../../_core/constants/size.dart';
import 'draw_triangle.dart';

class WebtoonListItem extends StatelessWidget {
  final ListPageWebtoonDTO webtoonDTO;

  const WebtoonListItem({
    super.key,
    required this.webtoonDTO,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(sizeBorder5),
          child: Stack(
            children: [
              Container(
                height: sizeWebtoonListItemPictureHeight160,
                child: Image.network(
                  "${imageURL}/WebtoonThumbnail/${webtoonDTO.image}",
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      "assets/default_webtoon_Thumbnail.jpg",
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              if (webtoonDTO.specially == "순위") ...[
                Container(
                  height: sizeWebtoonListItemPictureHeight160,
                  child: Stack(
                    children: [
                      Align(
                          alignment: Alignment(1, 1),
                          child: CustomPaint(
                              size: Size(75, 25),
                              painter: DrawTriangle(color: Colors.green))),
                      Align(
                          alignment: Alignment(1, 1),
                          child: Text("순위 상승",
                              style: TextStyle(color: Colors.white))),
                    ],
                  ),
                ),
              ],
              if (webtoonDTO.specially == "신작")
                Padding(
                  padding: EdgeInsets.all(3.0),
                  child: CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 15,
                      child: Text("신작", style: TextStyle(color: Colors.black))),
                ),
              if (webtoonDTO.specially == "무료")
                Stack(
                  children: [
                    Icon(Icons.circle, size: 34, color: Colors.black),
                    Positioned(
                        right: 2,
                        bottom: 2,
                        child: Icon(CupertinoIcons.clock,
                            color: Colors.green, size: 30)),
                  ],
                ),
            ],
          ),
        ),

        // SizedBox(height: ),

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            webtoonDTO.specially == "휴재"
                ? Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.all(
                            Radius.circular(3),
                          ),
                        ),
                        child: Text(
                          "${webtoonDTO.specially}",
                          style: TextStyle(color: Colors.grey, fontSize: 8),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 2),
                      Container(
                        constraints: BoxConstraints(
                            maxWidth: sizeGetScreenWidth(context) * 0.24),
                        child: Text("${webtoonDTO.title}",
                            style: Theme.of(context).textTheme.displayMedium,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  )
                : webtoonDTO.specially == "완결"
                    ? Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue),
                              borderRadius: BorderRadius.all(
                                Radius.circular(3),
                              ),
                            ),
                            child: Text(
                              "${webtoonDTO.specially}",
                              style: TextStyle(color: Colors.blue, fontSize: 8),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(width: 2),
                          Container(
                            constraints: BoxConstraints(
                                maxWidth: sizeGetScreenWidth(context) * 0.24),
                            child: Text("${webtoonDTO.title}",
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      )
                    : Container(
                        constraints: BoxConstraints(
                            maxWidth: sizeGetScreenWidth(context) * 0.29),
                        child: Text("${webtoonDTO.title}",
                            style: Theme.of(context).textTheme.displayMedium,
                            overflow: TextOverflow.ellipsis),
                      ),
          ],
        ),
        Row(
          children: [
            Container(
                constraints: BoxConstraints(
                    maxWidth: sizeGetScreenWidth(context) * 0.21),
                // child: Text("${webtoonDTO.authorNicknameList!.map((str) => str).toList().join('/')} ",
                child: Text(
                    "${webtoonDTO.authorNicknameList!.toList().join('/')} ",
                    style: Theme.of(context).textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis)),
            Container(
                child: Text(
                    "★ ${(webtoonDTO.starScore! / webtoonDTO.starCount!).toStringAsFixed(2)}",
                    style: Theme.of(context).textTheme.bodySmall,
                    maxLines: 1)),
          ],
        ),
      ],
    );
  }
}
