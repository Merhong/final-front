import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/dto/webtoon_DTO/detail_page_webtoon_DTO.dart';
import 'package:flutter_blog/ui/pages/webtoon/detail_page/webtoon_detail_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class WebtoonDetailThumbnail extends ConsumerWidget {
  final DetailPageWebtoonDTO webtoonDTO;

  const WebtoonDetailThumbnail({required this.webtoonDTO});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        DetailScrollListener(),
        buildThumbnail(context),
        buildInteresting(context, ref),
      ],
    );
  }

  Positioned buildInteresting(BuildContext context, WidgetRef ref) {
    return Positioned(
      child: SizedBox(
        height: 175,
        child: Align(
          alignment: Alignment(0, 1),
          child: InkWell(
            onTap: () {
              if (webtoonDTO.isInterest) {
                print("현재관심웹툰임 > 관심웹툰삭제시도");
                ref.read(webtoonDetailProvider.notifier).notifyInterestDelete();
              } else {
                print("현재관심웹툰아님 > 관심웹툰추가시도");
                ref.read(webtoonDetailProvider.notifier).notifyInterestCreate();
              }
            },
            child: webtoonDTO.isInterest == true
                ? Container(
                    height: 30,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: sizeM10),
                      child: Text("✔ 관심 ${NumberFormat('#,###').format(webtoonDTO.interestCount)}",
                          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500, fontSize: 17)),
                    ),
                  )
                : Container(
                    height: 30,
                    decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: sizeM10),
                      child: Text("+ 관심 ${NumberFormat('#,###').format(webtoonDTO.interestCount)}",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 17)),
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  Widget buildThumbnail(BuildContext context) {
    return Positioned(
      child: Center(
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
                (webtoonDTO.episodeList != null && webtoonDTO.episodeList!.length != 0)
                    ? "${imageURL}/EpisodeThumbnail/${webtoonDTO.episodeList![0].thumbnail}"
                    : "${imageURL}/EpisodeThumbnail/default_episode_Thumbnail.jpg",
                fit: BoxFit.cover,
                height: 190,
                width: sizeGetScreenWidth(context) * 0.85)),
      ),
    );
  }
}

//

class DetailScrollListener extends StatefulWidget {
  const DetailScrollListener({
    super.key,
  });

  @override
  State<DetailScrollListener> createState() => _DetailScrollListenerState();
}

class _DetailScrollListenerState extends State<DetailScrollListener> {
  final ScrollController _controller = ScrollController();

  double prev = 0;
  double height = 300;
  double op = 1.0;

  @override
  void initState() {
    _controller.addListener(() {
      scrollListener();
    });
    super.initState();
  }

  void scrollListener() {
    print("스크롤 동작중");
    double currentOffset = _controller.offset;
    print("currentOffset : $currentOffset");

    // 실습
    if (currentOffset < 300) {
      setState(() {
        height = 300 - currentOffset;
        op = (300 - currentOffset) / 300;
        if (height < 56) {
          height = 56;
        }
      });
    }

    // 301              300
    if (currentOffset > prev) {
      // 아래방향
      print("아래로 내려가요");
    }

    // 300              301
    if (currentOffset < prev) {
      // 위방향
      print("위로 올라가요");
    }

    if (currentOffset == _controller.position.maxScrollExtent) {
      print("가장 하단");
    }

    // currentOffset == 0;
    if (currentOffset == _controller.position.minScrollExtent) {
      print("가장 위");
    }

    prev = currentOffset;
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.blue, height: 60);
  }
}
