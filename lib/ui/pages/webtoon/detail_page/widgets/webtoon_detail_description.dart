import 'package:flutter/material.dart';
import 'package:flutter_blog/data/dto/webtoon_DTO/detail_page_webtoon_DTO.dart';

import '../../../../../_core/constants/size.dart';
import '../../../../common_widgets/advertising.dart';

class WebtoonDetailDescription extends StatefulWidget {
  final DetailPageWebtoonDTO webtoonDTO;

  const WebtoonDetailDescription({
    super.key,
    required this.webtoonDTO,
  });

  @override
  State<WebtoonDetailDescription> createState() => _WebtoonDetailDescriptionState();
}

class _WebtoonDetailDescriptionState extends State<WebtoonDetailDescription> {
  bool isState = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(sizePaddingLR17, sizeM10, sizePaddingLR17, sizeM10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${widget.webtoonDTO.title}", style: Theme.of(context).textTheme.titleLarge),
          Row(
            children: [
              InkWell(
                onTap: () {
                  print("작가페이지로 가야함");
                },
                child: Row(
                  children: [Text("${widget.webtoonDTO.authorList.map((author) => author.authorNickname).toList().join('/')}"), Text("✅")],
                ),
              ),
              Text("  ·  "),
              Text("${widget.webtoonDTO.webtoonWeekDayEnum} 연재", style: TextStyle(color: Colors.grey)),
            ],
          ),
          // Text("${widget.webtoon.intro}", maxLines: 1, style: TextStyle(overflow: TextOverflow.ellipsis)),
          // SizedBox(height: sizeM10),

          //
          ExpansionPanelList(
            expansionCallback: (panelIndex, isExpanded) {
              // print("isState:$isState");
              // print("isExpanded:$isExpanded");
              setState(() {});
            },
            children: [
              ExpansionPanel(
                isExpanded: isState,
                headerBuilder: (context, isExpanded) {
                  // print("확장됨isExpanded:${isExpanded}");
                  isState = !isExpanded;
                  return Text(
                    "${widget.webtoonDTO.intro}",
                    maxLines: 1,
                    style: TextStyle(overflow: TextOverflow.ellipsis),
                  );
                },
                body: Column(
                  children: [
                    Text("${widget.webtoonDTO.intro}"),
                    Text("연령 ${widget.webtoonDTO.ageLimit}세 이용가"),
                  ],
                ),
              ),
            ],
          ),

          //

          Stack(
            children: [
              ExpansionTile(
                title: Text(
                  "${widget.webtoonDTO.intro}",
                  maxLines: 1,
                  style: TextStyle(overflow: TextOverflow.ellipsis),
                ),
                children: <Widget>[
                  Column(
                    children: [
                      Text("${widget.webtoonDTO.intro}"),
                      Text("연령 ${widget.webtoonDTO.ageLimit}세 이용가"),
                    ],
                  ),
                ],
              ),
            ],
          ),

          //

          //

          Advertising(ADHeight: 75),
        ],
      ),
    );
  }
}
