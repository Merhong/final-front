import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/data/dto/webtoon_dto/best_DTO.dart';
import 'package:flutter_blog/data/provider/param_provider.dart';
import 'package:flutter_blog/ui/pages/webtoon/best_page/webtoon_best_view_model.dart';
import 'package:flutter_blog/ui/pages/webtoon/detail_page/webtoon_detail_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class CustomBestView extends ConsumerWidget {
  final int index;

  const CustomBestView({super.key, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WebtoonBestModel? model = ref.watch(webtoonBestProvider);

    if (model == null) {
      return Center(child: CircularProgressIndicator());
    }
    List<BestDTO> bestList = model!.bestDTOList;

    return ListView.builder(
      itemCount: bestList.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            ParamStore paramStore = ref.read(paramProvider);
            paramStore.addWebtoonDetailId(bestList[index].id);
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => WebtoonDetailPage()));
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Container(
              height: 120,
              color: Colors.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      "${imageURL}/WebtoonThumbnail/${bestList[index].image}",
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          "assets/default_webtoon_Thumbnail.jpg",
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  // 중앙에 제목과 날짜 배치
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${bestList[index].title}",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${bestList[index].authorNicknameList}",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      // Text(
                      //   "시트콤 같은 일상툰",
                      //   style: TextStyle(
                      //     color: Colors.black,
                      //   ),
                      // ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.red,
                          ),
                          Text(
                            "${(bestList[index].starScore! / (bestList[index].starCount == 0 ? 1 : bestList[index].starCount!)).toStringAsFixed(2)}",
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                          Text(
                            "   ${DateFormat('yyyy-MM-dd').format(bestList[index].episodeUpdatedAt!)}",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
