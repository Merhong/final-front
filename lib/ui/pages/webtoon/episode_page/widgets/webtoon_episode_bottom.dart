import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/dto/episode_dto/episode_DTO.dart';
import 'package:flutter_blog/data/provider/param_provider.dart';
import 'package:flutter_blog/ui/common_widgets/author_list_select.dart';
import 'package:flutter_blog/ui/common_widgets/bottom_rule.dart';
import 'package:flutter_blog/ui/pages/webtoon/episode_page/webtoon_episode_page.dart';
import 'package:flutter_blog/ui/pages/webtoon/episode_page/widgets/alert_dialog_star.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WebtoonEpisodeBottom extends StatelessWidget {
  const WebtoonEpisodeBottom({
    super.key,
    required this.episodeDTO,
  });

  final EpisodeDTO episodeDTO;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(height: 1, color: Colors.grey, thickness: 1),
        Padding(
          padding: EdgeInsets.fromLTRB(sizePaddingLR17, sizeM10, sizePaddingLR17, sizeM10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                // "★ ${(episodeDTO.starScore / episodeDTO.starCount).toStringAsFixed(2)}",
                "★ ${(episodeDTO.starScore / (episodeDTO.starCount == 0 ? 1 : episodeDTO.starCount)).toStringAsFixed(2)}",
                style: TextStyle(color: Colors.red, fontSize: 25, fontWeight: FontWeight.bold),
              ),
              episodeDTO.star == false
                  ? InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialogStar(webtoonName: episodeDTO.webtoonName, episodeName: episodeDTO.detailTitle);
                          },
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(sizeS5),
                        decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.black)),
                        child: Text("별점주기", style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    )
                  : InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(sizeS5),
                        decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.black)),
                        child: Text("참여완료", style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
            ],
          ),
        ),
        Divider(height: 1, color: Colors.grey, thickness: 1),
        Padding(
          padding: EdgeInsets.fromLTRB(sizePaddingLR17, sizeM10, sizePaddingLR17, sizeM10),
          child: AuthorListSelect(
            webtoonTitle: episodeDTO.webtoonName,
            authorList: episodeDTO.authorList,
            inkWellChild: Column(
              children: [
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "작가의 말",
                        style: TextStyle(color: Colors.black, fontSize: 17),
                        children: [
                          TextSpan(
                            text: " (${episodeDTO.authorList.map((author) => author.authorNickname).toList().join('/').replaceAll(' ', '')})",
                            style: TextStyle(color: Colors.grey[600], fontSize: 13),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 5),
                Container(constraints: BoxConstraints(minHeight: 50), alignment: Alignment(-1, -1), child: Text("${episodeDTO.authorText}")),
              ],
            ),
          ),
        ),
        WebtoonEpisodeNextEpisode(episodeDTO: episodeDTO),
        BottomRule(),
      ],
    );
  }
}

class WebtoonEpisodeNextEpisode extends ConsumerWidget {
  EpisodeDTO episodeDTO;

  WebtoonEpisodeNextEpisode({super.key, required this.episodeDTO});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int selectEpisodeIndex = episodeDTO.episodeMoveDTOList.indexWhere((moveDTO) => moveDTO.id == episodeDTO.episodeId);
    ParamStore ps = ref.read(paramProvider);

    return ps.webtoonLastEpisodeId == episodeDTO.episodeId
        // ? Column(
        //     children: [
        //       Divider(height: 1, color: Colors.grey, thickness: 1),
        //       Text("마지막 에피소드에요.", style: TextStyle(fontSize: 30)),
        //     ],
        //   )
        ? SizedBox()
        : Column(
            children: [
              Divider(height: 1, color: Colors.grey, thickness: 1),
              Container(
                padding: EdgeInsets.fromLTRB(sizePaddingLR17, 20, sizePaddingLR17, 20),
                child: InkWell(
                  onTap: () {
                    ps.isEpisodeMove = true;
                    ps.addEpisodeDetailId(episodeDTO.episodeMoveDTOList[selectEpisodeIndex - 1].id); // 역순정렬?
                    print("실행  에피넘어감");
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => WebtoonEpisodePage()));
                  },
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(sizeBorder5), color: Colors.grey[300]),
                    padding: EdgeInsets.all(sizeM10),
                    child: Row(
                      children: [
                        SizedBox(
                          width: sizeGetScreenWidth(context) * 0.25,
                          height: sizeXL50,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(sizeBorder5),
                            child: Image.network('$imageURL/EpisodeThumbnail/${episodeDTO.episodeMoveDTOList[selectEpisodeIndex - 1].thumbnail}',
                                fit: BoxFit.cover, errorBuilder: (context, error, stackTrace) {
                              return Image.asset("assets/default_episode_Thumbnail.jpg", fit: BoxFit.cover);
                            }),
                          ),
                        ),
                        SizedBox(width: sizeM10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "다음화 보기",
                              style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                            ),
                            Container(
                              constraints: BoxConstraints(maxWidth: sizeGetScreenWidth(context) * 0.5),
                              child: Text("${episodeDTO.episodeMoveDTOList[selectEpisodeIndex - 1].detailTitle}", overflow: TextOverflow.ellipsis),
                            ),
                          ],
                        ),
                        Spacer(),
                        Icon(Icons.navigate_next, size: 30),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}
