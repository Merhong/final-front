import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/_core/constants/url.dart';
import 'package:flutter_blog/data/dto/other_dto/advertising_main_DTO.dart';
import 'package:flutter_blog/data/provider/param_provider.dart';
import 'package:flutter_blog/ui/pages/webtoon/detail_page/webtoon_detail_page.dart';
import 'package:flutter_blog/ui/pages/webtoon/list_page/webtoon_list_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WebtoonListPageView extends ConsumerStatefulWidget {
  const WebtoonListPageView({
    super.key,
  });

  @override
  _WebtoonListPageViewState createState() => _WebtoonListPageViewState();
}

class _WebtoonListPageViewState extends ConsumerState<WebtoonListPageView> {
  int currentPage = 0;
  PageController _PageController = PageController(initialPage: 0);

  late int lastPage;

  @override
  void initState() {
    super.initState();

    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (currentPage < lastPage) {
        currentPage++;
      } else {
        currentPage = 0;
      }

      _PageController.animateToPage(
        currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    List<AdvertisingMainDTO> advertisingMainDTOList = ref.watch(webtoonListProvider)!.advertisingMainDTOList!;
    lastPage = advertisingMainDTOList.length;

    return SizedBox(
      // height: 210,
      // width: sizeGetScreenWidth(context),
      child: PageView.builder(
        pageSnapping: true,
        controller: _PageController,
        onPageChanged: (value) {
          currentPage = value;
          // print("페이지넘김currentPage:${currentPage}");
          // print("value${value}");
        },
        itemCount: advertisingMainDTOList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              if (advertisingMainDTOList[index].isWebLink == true) {
                URLLink("${advertisingMainDTOList[index].linkURL}");
              } else {
                ParamStore ps = ref.read(paramProvider);
                ps.addWebtoonDetailId(advertisingMainDTOList[index].webtoonId);
                ps.addBottomNavigationBarIndex(0);
                Navigator.push(context, MaterialPageRoute(builder: (_) => WebtoonDetailPage()));
              }
            },
            child: Stack(
              children: [
                Container(
                  height: double.infinity,
                  width: sizeGetScreenWidth(context),
                  child: Image.network(
                    "${imageURL}${advertisingMainDTOList[index].photo}",
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        "assets/default_episode_Thumbnail.jpg",
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
                Align(
                  alignment: Alignment(0.9, 0.55),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.all(Radius.circular(sizeBorder5))),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(4, 2, 4, 2),
                      child: Text(
                        "${index + 1} / ${advertisingMainDTOList.length}",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: sizePaddingLR17),
                  child: Align(
                    alignment: Alignment(0, 1),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(sizeBorder5),
                        ),
                        color: advertisingMainDTOList[index].isWebLink == true
                            ? IdToColor(advertisingMainDTOList[index].id)
                            : IdToColor(advertisingMainDTOList[index].webtoonId),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          children: [
                            SizedBox(width: sizeS5),
                            Container(
                              constraints: BoxConstraints(maxWidth: sizeGetScreenWidth(context) * 0.8),
                              child: RichText(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                  text: "${advertisingMainDTOList[index].mainText} ",
                                  style: TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold),
                                  children: [
                                    TextSpan(
                                      text: " ${advertisingMainDTOList[index].subText}",
                                      style: TextStyle(fontSize: 13, color: Colors.grey[700], fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
