import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/dto/user_dto/interest_author_detail_DTO.dart';
import 'package:flutter_blog/data/provider/param_provider.dart';
import 'package:flutter_blog/ui/pages/webtoon/detail_page/webtoon_detail_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyInterestAuthorDetailArt extends ConsumerWidget {
  InterestAuthorDetailDTO interestAuthorDetailDTO;

  MyInterestAuthorDetailArt(this.interestAuthorDetailDTO);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15),
        Container(
          padding: EdgeInsets.fromLTRB(sizePaddingLR17, 0, 0, 0),
          alignment: Alignment(-1, 0),
          child: Text("${interestAuthorDetailDTO.authorNickname} 작가의 작품", style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        SizedBox(height: 5),
        Container(
          height: 120,
          child: PageView.builder(
            controller: PageController(viewportFraction: 0.82),
            pageSnapping: true,
            scrollDirection: Axis.horizontal,
            padEnds: false,
            itemCount: interestAuthorDetailDTO.authorWebtoonList!.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  SizedBox(width: sizePaddingLR17),
                  // SizedBox(width: index == 0 ? sizePaddingLR17 : 5),
                  InkWell(
                    onTap: () {
                      ParamStore paramStore = ref.read(paramProvider);
                      paramStore.addWebtoonDetailId(interestAuthorDetailDTO.authorWebtoonList![index].id);
                      // paramStore.addBottomNavigationBarIndex(0);
                      Navigator.push(context, MaterialPageRoute(builder: (_) => WebtoonDetailPage()));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: sizeGetScreenWidth(context) * 0.74,
                        decoration: BoxDecoration(
                          // color: Color.fromRGBO(150, 150, 150, 0.5),
                          borderRadius: BorderRadius.circular(9),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Row(
                          children: [
                            Image.network("${imageURL}WebtoonThumbnail/${interestAuthorDetailDTO.authorWebtoonList![index].image}", fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                              return Image.asset("assets/default_episode_Thumbnail.jpg", fit: BoxFit.cover);
                            }),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("웹툰", style: TextStyle(color: Colors.grey[600])),
                                  Text("${interestAuthorDetailDTO.authorWebtoonList![index].title}", style: TextStyle(fontWeight: FontWeight.bold)),
                                  SizedBox(height: 15),
                                  Text(
                                    "${interestAuthorDetailDTO.authorWebtoonList![index].episodeUpdatedAt.toString().split(" ")[0]} 업데이트",
                                    style: TextStyle(color: Colors.grey[600], fontSize: 12, fontFamily: "JamsilRegular"),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Container(color: Colors.black, height: 33, width: 17),
                  // SizedBox(width: index == interestAuthorDetailDTO.authorWebtoonList!.length - 1 ? sizePaddingLR17 : 5),
                ],
              );
            },
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(sizePaddingLR17, 20, 0, 5),
          alignment: Alignment(-1, 0),
          child: Text("게시글", style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}
