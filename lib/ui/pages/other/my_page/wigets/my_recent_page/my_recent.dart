import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/dto/webtoon_dto/recent_DTO.dart';
import 'package:flutter_blog/data/provider/param_provider.dart';
import 'package:flutter_blog/ui/common_widgets/specially_tag.dart';
import 'package:flutter_blog/ui/common_widgets/title_tag.dart';
import 'package:flutter_blog/ui/pages/other/my_page/my_recent_view_model.dart';
import 'package:flutter_blog/ui/pages/other/my_page/wigets/my_recent_page/my_recent_top_menu.dart';
import 'package:flutter_blog/ui/pages/webtoon/detail_page/webtoon_detail_page.dart';
import 'package:flutter_blog/ui/pages/webtoon/episode_page/webtoon_episode_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyRecent extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final refreshKey = GlobalKey<RefreshIndicatorState>();

    MyRecentPageModel? model = ref.watch(myRecentPageProvider);
    if (model == null) {
      return Center(child: CircularProgressIndicator());
    }
    List<RecentDTO> myRecentDTOList = model.myRecentDTOList;
    return RefreshIndicator(
      key: refreshKey,
      onRefresh: () async {
        print("리플래시됨");
        await ref.read(myRecentPageProvider.notifier).notifyInit();
      },
      child: Column(
        children: [
          Divider(color: Colors.black26, height: 1, thickness: 1),
          MyRecentTopMenu(allLength: myRecentDTOList.length),
          Divider(color: Colors.black26),
          Expanded(
            child: ListView.builder(
              itemCount: myRecentDTOList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      height: 85,
                      padding: EdgeInsets.fromLTRB(sizePaddingLR17, sizeS5, sizePaddingLR17, sizeS5),
                      child: Row(
                        children: [
                          buildPhoto(ref, myRecentDTOList[index], context),
                          SizedBox(width: sizeM10),
                          buildDescription(ref, myRecentDTOList[index], context),
                          // SizedBox(width: sizeL20),
                          buildEpisodeGo(ref, myRecentDTOList[index], context),
                        ],
                      ),
                    ),
                    Divider(color: Colors.black26),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildEpisodeGo(WidgetRef ref, RecentDTO recentDTO, BuildContext context) {
    return InkWell(
      onTap: () {
        ParamStore ps = ref.read(paramProvider);

        // 웹툰디테일 안거쳐서 가니까 없으면 마지막 에피소드에서도 넘어가짐
        ps.addWebtoonLastEpisode(recentDTO.lastEpisodeId);
        ps.addWebtoonFirstEpisode(recentDTO.firstEpisodeId);

        ps.addEpisodeDetailId(recentDTO.recentEpisodeId);
        ps.addBottomNavigationBarIndex(0);
        Navigator.push(context, MaterialPageRoute(builder: (_) => WebtoonEpisodePage()));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            // constraints: BoxConstraints(maxWidth: sizeGetScreenWidth(context) * 0.2),
            child: Text(
              "이어보기 >",
              style: TextStyle(color: Colors.black, overflow: TextOverflow.ellipsis),
            ),
          ),
          SizedBox(height: 3),
          Text(
              "${recentDTO.recentEpisodeTitle.contains("화") //
                  ? recentDTO.recentEpisodeTitle.split("화")[0] + "화" //
                  : recentDTO.recentEpisodeTitle.length >= 8 ? recentDTO.recentEpisodeTitle.substring(0, 7) + "..." //
                      : recentDTO.recentEpisodeTitle}",
              style: TextStyle(fontSize: 13, color: Colors.grey[600])),
          SizedBox(height: 3),
        ],
      ),
    );
  }

  Expanded buildDescription(WidgetRef ref, RecentDTO recentDTO, BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          ParamStore ps = ref.read(paramProvider);
          ps.addWebtoonDetailId(recentDTO.webtoonId);
          ps.addBottomNavigationBarIndex(0);
          Navigator.push(context, MaterialPageRoute(builder: (_) => WebtoonDetailPage()));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  // width: 200,
                  constraints: BoxConstraints(maxWidth: sizeGetScreenWidth(context) * 0.6),
                  child: Text(
                    "${recentDTO.webtoonTitle}",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
                  ),
                ),
                SizedBox(width: 3),
                // interestWebtoonDTOList[index].webtoonUpdateAt == null
                //     ? SizedBox() :
                recentDTO.webtoonSpeciallyEnum == "완결"
                    ? TitleTag(titleTagEnum: TitleTagEnum.end)
                    : recentDTO.webtoonSpeciallyEnum == "휴재"
                        ? TitleTag(titleTagEnum: TitleTagEnum.stop)
                        : SizedBox()
              ],
            ),
            SizedBox(height: 3),
            recentDTO.updatedAt != null && DateTime.now().difference(recentDTO.updatedAt!).inHours < 50
                ? RichText(
                    text: TextSpan(
                    text: DateTime.now().difference(recentDTO.updatedAt!).inHours >= 1
                        ? "${DateTime.now().difference(recentDTO.updatedAt!).inHours}시간 전 "
                        : DateTime.now().difference(recentDTO.updatedAt!).inMinutes >= 1
                            ? "${DateTime.now().difference(recentDTO.updatedAt!).inMinutes}분 전 "
                            : DateTime.now().difference(recentDTO.updatedAt!).inSeconds >= 5
                                ? "${DateTime.now().difference(recentDTO.updatedAt!).inSeconds}초 전 "
                                : "지금 ",
                    style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                    children: [
                      // TextSpan(text: "본", style: TextStyle(fontSize: 13, color: Colors.grey[600])),
                    ],
                  ))
                : SizedBox(),
            SizedBox(height: 3),
            RichText(
              text: TextSpan(
                text: "남은 이야기 ",
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.black),
                children: [
                  TextSpan(
                    text: "${recentDTO.totalCount - recentDTO.viewCount}",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                  TextSpan(
                    text: " / ${recentDTO.totalCount}",
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),

            // interestWebtoonDTOList[index].webtoonUpdateAt != null &&
            //         todayDateTime.difference(interestWebtoonDTOList[index].webtoonUpdateAt!).inHours < 50
            //     ? RichText(
            //         text:
            //             // TextSpan(
            //             //   text: "새 이야기 ",
            //             //   style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.black),
            //             //   children: [
            //             //     TextSpan(text: "등록!", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.green)),
            //             //   ],
            //             // ),
            //             TextSpan(
            //         text: DateTime.now().difference(interestWebtoonDTOList[index].webtoonUpdateAt!).inHours >= 1
            //             ? "${DateTime.now().difference(interestWebtoonDTOList[index].webtoonUpdateAt!).inHours}시간 전 "
            //             : DateTime.now().difference(interestWebtoonDTOList[index].webtoonUpdateAt!).inMinutes >= 1
            //                 ? "${DateTime.now().difference(interestWebtoonDTOList[index].webtoonUpdateAt!).inMinutes}분 전 "
            //                 : DateTime.now().difference(interestWebtoonDTOList[index].webtoonUpdateAt!).inSeconds >= 5
            //                     ? "${DateTime.now().difference(interestWebtoonDTOList[index].webtoonUpdateAt!).inSeconds}초 전 "
            //                     : "지금 ",
            //         style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.green),
            //         children: [
            //           TextSpan(text: "새 이야기", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.black)),
            //         ],
            //       ))
            //     : interestWebtoonDTOList[index].webtoonSpeciallyEnum == "무료"
            //         ? Text("무료 충전 완료!", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.green))
            //         : SizedBox(),
          ],
        ),
      ),
    );
  }

  ClipRRect buildPhoto(WidgetRef ref, RecentDTO myRecentDTO, BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      child: InkWell(
        onTap: () {
          ParamStore ps = ref.read(paramProvider);
          ps.addWebtoonDetailId(myRecentDTO.webtoonId);
          ps.addBottomNavigationBarIndex(0);
          Navigator.push(context, MaterialPageRoute(builder: (_) => WebtoonDetailPage()));
        },
        child: Stack(
          children: [
            Image.network(
              "${imageURL}/EpisodeThumbnail/${myRecentDTO.recentEpisodeThumbnail}",
              height: sizeGetScreenWidth(context) * 0.18,
              width: sizeGetScreenWidth(context) * 0.25,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  "assets/default_episode_Thumbnail.jpg",
                  height: sizeGetScreenWidth(context) * 0.18,
                  width: sizeGetScreenWidth(context) * 0.25,
                  fit: BoxFit.cover,
                );
              },
            ),
            myRecentDTO.webtoonSpeciallyEnum == "신작"
                ? SpeciallyTag(speciallyTagEnum: SpeciallyTagEnum.isNew)
                : myRecentDTO.webtoonSpeciallyEnum == "무료"
                    ? SpeciallyTag(speciallyTagEnum: SpeciallyTagEnum.free)
                    : myRecentDTO.webtoonSpeciallyEnum == "순위"
                        ? Container(
                            height: sizeGetScreenWidth(context) * 0.18,
                            width: sizeGetScreenWidth(context) * 0.25,
                            child: SpeciallyTag(speciallyTagEnum: SpeciallyTagEnum.rank),
                          )
                        : SizedBox()
          ],
        ),
      ),
    );
  }
}
