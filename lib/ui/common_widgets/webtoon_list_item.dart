import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../_core/constants/size.dart';
import '../../data/model/webtoon.dart';
import 'draw_triangle.dart';

class WebtoonListItem extends StatelessWidget {
  const WebtoonListItem({
    super.key,
    required this.webtoon,
  });

  final Webtoon webtoon;

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
                child: Image.asset("assets/WebtoonThumbnail/${webtoon.image}", fit: BoxFit.cover),
              ),
              if (webtoon.specially == "순위") ...[
                Container(
                  height: sizeWebtoonListItemPictureHeight160,
                  child: Stack(
                    children: [
                      Align(alignment: Alignment(1, 1), child: CustomPaint(size: Size(75, 25), painter: DrawTriangle(color: Colors.green))),
                      Align(alignment: Alignment(1, 1), child: Text("순위 상승", style: TextStyle(color: Colors.white))),
                    ],
                  ),
                ),
              ],
              if (webtoon.specially == "신작")
                Padding(
                  padding: EdgeInsets.all(3.0),
                  child: CircleAvatar(backgroundColor: Colors.green, radius: 15, child: Text("신작", style: TextStyle(color: Colors.black))),
                ),
              if (webtoon.specially == "무료")
                Stack(
                  children: [
                    Icon(Icons.circle, size: 34, color: Colors.black),
                    Positioned(right: 2, bottom: 2, child: Icon(CupertinoIcons.clock, color: Colors.green, size: 30)),
                  ],
                ),
            ],
          ),
        ),

        // SizedBox(height: ),

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            webtoon.specially == "휴재"
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
                          "${webtoon.specially}",
                          style: TextStyle(color: Colors.grey, fontSize: 8),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 2),
                      Container(
                        constraints: BoxConstraints(maxWidth: sizeGetScreenWidth(context) * 0.24),
                        child: Text("${webtoon.title}", style: TextStyle(fontWeight: FontWeight.w600), overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  )
                : webtoon.specially == "완결"
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
                              "${webtoon.specially}",
                              style: TextStyle(color: Colors.blue, fontSize: 8),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(width: 2),
                          Container(
                            constraints: BoxConstraints(maxWidth: sizeGetScreenWidth(context) * 0.24),
                            child: Text("${webtoon.title}", style: TextStyle(fontWeight: FontWeight.w600), overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      )
                    : Container(
                        constraints: BoxConstraints(maxWidth: sizeGetScreenWidth(context) * 0.29),
                        child: Text("${webtoon.title}", style: TextStyle(fontWeight: FontWeight.w600), overflow: TextOverflow.ellipsis),
                      ),
          ],
        ),
        Row(
          children: [
            Container(
                constraints: BoxConstraints(maxWidth: sizeGetScreenWidth(context) * 0.21),
                child: Text("${webtoon.author} ", style: TextStyle(fontSize: 9, color: Colors.grey), overflow: TextOverflow.ellipsis)),
            Container(child: Text("★ ${webtoon.starCount}", maxLines: 1, style: TextStyle(fontSize: 10, color: Colors.grey))),
          ],
        ),
      ],
    );
  }
}
