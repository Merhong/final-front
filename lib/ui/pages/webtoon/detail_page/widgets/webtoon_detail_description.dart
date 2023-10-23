import 'package:flutter/material.dart';

import '../../../../../_core/constants/size.dart';
import '../../../../../data/model/webtoon.dart';
import '../../../../common_widgets/advertising.dart';

class WebtoonDetailDescription extends StatefulWidget {
  const WebtoonDetailDescription({
    super.key,
    required this.webtoon,
  });

  final Webtoon webtoon;

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
          Text("${widget.webtoon.title}", style: Theme.of(context).textTheme.titleMedium),
          Row(
            children: [
              Text("${widget.webtoon.author.authorname}"),
              Text(" · "),
              Text("${widget.webtoon.weekDay}요웹툰"),
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
                    "${widget.webtoon.intro}",
                    maxLines: 1,
                    style: TextStyle(overflow: TextOverflow.ellipsis),
                  );
                },
                body: Column(
                  children: [
                    Text("${widget.webtoon.intro}"),
                    Text("연령 ${widget.webtoon.age}세 이용가"),
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
                  "${widget.webtoon.intro}",
                  maxLines: 1,
                  style: TextStyle(overflow: TextOverflow.ellipsis),
                ),
                children: <Widget>[
                  Column(
                    children: [
                      Text("${widget.webtoon.intro}"),
                      Text("연령 ${widget.webtoon.age}세 이용가"),
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
