import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/dto/user_dto/my_comment_DTO.dart';
import 'package:flutter_blog/data/provider/param_provider.dart';
import 'package:flutter_blog/ui/common_widgets/my_stackbar.dart';
import 'package:flutter_blog/ui/common_widgets/title_tag.dart';
import 'package:flutter_blog/ui/pages/other/my_page/my_comment_view_model.dart';
import 'package:flutter_blog/ui/pages/webtoon/episode_page/webtoon_episode_page.dart';
import 'package:flutter_blog/ui/pages/webtoon/re_reply_page/webtoon_re_reply_page.dart';
import 'package:flutter_blog/ui/pages/webtoon/reply_page/webtoon_reply_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

import '../../../../../common_widgets/comment_box.dart';

class MyComment extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final refreshKey = GlobalKey<RefreshIndicatorState>();

    MyCommentPageModel? model = ref.watch(myCommentPageProvider);
    if (model == null) {
      return Center(child: CircularProgressIndicator());
    }
    List<MyCommentDTO> myCommentDTOList = model.myCommentDTOList;

    int replyCount = 0;
    int reReplyCount = 0;
    int totalLikeCount = 0;
    int totalDislikeCount = 0;
    if (myCommentDTOList.length != 0) {
      replyCount = myCommentDTOList.where((element) => !(element.isReComment)).length;
      reReplyCount = myCommentDTOList.where((element) => element.isReComment).length;
      totalLikeCount = myCommentDTOList.map((element) => element.likeCommentCount).reduce((value, element) => value + element);
      // totalDislikeCount = myCommentDTOList.map((element) => element.dislikeCommentCount).reduce((value, element) => value + element);
    }

    return Column(
      children: [
        Divider(color: Colors.grey, height: 1),
        buildMyCommentTopMenu(myCommentDTOList.length),
        Divider(color: Colors.grey, height: 1),
        Expanded(
          child: RefreshIndicator(
            key: refreshKey,
            onRefresh: () async => await ref.read(myCommentPageProvider.notifier).notifyInit(),
            child: ListView.separated(
              separatorBuilder: (context, index) => Divider(color: Colors.grey, height: 1),
              itemCount: myCommentDTOList.length + 1,
              itemBuilder: (context, index) {
                return index == 0
                    ? buildMyCommentCount(replyCount, reReplyCount, totalLikeCount)
                    : buildCommentDescription(myCommentDTOList[index - 1], context, ref);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget buildCommentDescription(MyCommentDTO myCommentDTO, BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.fromLTRB(sizePaddingLR17, sizeM10, sizePaddingLR17, sizeM10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${DateFormat("yyyy-MM-dd HH:mm:ss").format(myCommentDTO.createdAt)}", style: TextStyle(color: Colors.grey[600], fontSize: 13)),
              InkWell(
                  onTap: () {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    mySnackbar(
                      context,
                      3000,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("정말 삭제하시겠습니까?"),
                          SizedBox(width: sizeM10),
                          InkWell(
                            child: Icon(Icons.check, color: Colors.red),
                            onTap: () {
                              ScaffoldMessenger.of(context).clearSnackBars();
                              print("스낵바-삭제누름");
                              myCommentDTO.isReComment == false
                                  ? ref.read(myCommentPageProvider.notifier).notifyCommentDelete(myCommentDTO.commentId)
                                  : ref.read(myCommentPageProvider.notifier).notifyReCommentDelete(myCommentDTO.reCommentId);
                            },
                          ),
                          SizedBox(width: sizeL20),
                          InkWell(
                            child: Icon(Icons.clear, color: Colors.white),
                            onTap: () {
                              ScaffoldMessenger.of(context).clearSnackBars();
                            },
                          ),
                        ],
                      ),
                    );
                  },
                  child: Icon(Icons.close, color: Colors.grey[700]))
            ],
          ),
          Align(
            alignment: Alignment(-1, 0),
            child: Stack(children: [
              myCommentDTO.isReComment == true ? TitleTag(titleTagEnum: TitleTagEnum.reReply) : TitleTag(titleTagEnum: TitleTagEnum.reply),
              Text("        ${myCommentDTO.text}"),
            ]),
          ),
          SizedBox(height: sizeS5),
          Row(
            children: [
              InkWell(
                onTap: () {
                  // ref.read(paramProvider).addCommentDetailId((myCommentDTO.id));
                  ref.read(paramProvider).addEpisodeDetailId((myCommentDTO.episodeId));
                  Navigator.push(context, MaterialPageRoute(builder: (_) => WebtoonEpisodePage()));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    "${imageURL}/EpisodeThumbnail/${myCommentDTO.episodeThumbnail}",
                    // width: 30,
                    height: 40,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset("assets/default_episode_Thumbnail.jpg", width: 70, height: 40, fit: BoxFit.fill);
                    },
                  ),
                ),
              ),
              SizedBox(width: sizeM10),
              InkWell(
                onTap: () {
                  // ref.read(paramProvider).addCommentDetailId((myCommentDTO.id));
                  ref.read(paramProvider).addEpisodeDetailId((myCommentDTO.episodeId));
                  Navigator.push(context, MaterialPageRoute(builder: (_) => WebtoonEpisodePage()));
                },
                child: Container(
                  constraints: BoxConstraints(maxWidth: sizeGetScreenWidth(context) * 0.6),
                  child: Wrap(children: [
                    Text("[${myCommentDTO.webtoonTitle}] ", style: TextStyle(fontSize: 12, overflow: TextOverflow.ellipsis)),
                    Text("${myCommentDTO.episodeTitle}", style: TextStyle(fontSize: 12, overflow: TextOverflow.ellipsis)),
                    Text(" >", style: TextStyle(color: Colors.grey[600], fontSize: 15)),
                  ]),
                ),
              ),
            ],
          ),
          SizedBox(height: sizeM10),
          Row(
            children: [
              InkWell(
                onTap: () {
                  print("답글보기");
                  // ParamStore ps = ref.read(paramProvider);
                  ref.read(paramProvider).addCommentDetailId((myCommentDTO.commentId));
                  ref.read(paramProvider).addEpisodeDetailId((myCommentDTO.episodeId));
                  Navigator.push(context, MaterialPageRoute(builder: (_) => ReReplyPage()));
                },
                child: myCommentDTO.isReComment == true
                    ? Text("답글보기 >", style: TextStyle(fontSize: 12, color: Colors.grey[700]))
                    : CommentBox(
                        commentBoxRow: Row(children: [Text("답글${myCommentDTO.reCommentCount == 0 ? '' : ' ${myCommentDTO.reCommentCount}'}")]),
                      ),
              ),
              Spacer(),
              Row(
                children: [
                  Icon(Icons.thumb_up_outlined, color: Colors.grey),
                  SizedBox(width: 3),
                  Text("${myCommentDTO.likeCommentCount}", style: TextStyle(color: Colors.grey)),
                ],
              ),
              SizedBox(width: sizeL20),
              Row(
                children: [
                  Icon(Icons.thumb_down_outlined, color: Colors.grey),
                  SizedBox(width: 3),
                  Text("${myCommentDTO.dislikeCommentCount}", style: TextStyle(color: Colors.grey)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding buildMyCommentCount(int replyCount, int reReplyCount, int totalLikeCount) {
    return Padding(
      padding: EdgeInsets.fromLTRB(sizePaddingLR17, sizeM10, sizePaddingLR17, sizeM10),
      child: Container(
        padding: EdgeInsets.all(sizeM10),
        decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(children: [Text('총 댓글 수'), Text('${replyCount}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))]),
            Container(color: Colors.grey[500], width: 1, height: 30),
            Column(children: [Text('총 답글 수'), Text('${reReplyCount}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))]),
            Container(color: Colors.grey[500], width: 1, height: 30),
            Column(children: [Text('받은 좋아요 수'), Text('${totalLikeCount}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))]),
          ],
        ),
      ),
    );
  }

  Container buildMyCommentTopMenu(int count) {
    return Container(
      padding: EdgeInsets.fromLTRB(sizePaddingLR17, sizeM10, sizePaddingLR17, sizeM10),
      child: Row(
        children: [
          Text("웹툰 ${count}", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          SizedBox(width: sizeL20),
          Text("베도/도전 0", style: TextStyle(color: Colors.grey[500], fontWeight: FontWeight.bold)),
          SizedBox(width: sizeL20),
          Text("최신순", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          Text("▼"),
          Spacer(),
          InkWell(child: Icon(Icons.warning, size: 20, color: Colors.grey)),
        ],
      ),
    );
  }
}
