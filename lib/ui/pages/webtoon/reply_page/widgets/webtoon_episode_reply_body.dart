import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/dto/comment_dto/comment_DTO.dart';
import 'package:flutter_blog/data/provider/param_provider.dart';
import 'package:flutter_blog/ui/common_widgets/my_stackbar.dart';
import 'package:flutter_blog/ui/common_widgets/title_tag.dart';
import 'package:flutter_blog/ui/pages/webtoon/re_reply_page/webtoon_re_reply_page.dart';
import 'package:flutter_blog/ui/pages/webtoon/reply_page/webtoon_reply_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class WebtoonReplyBody extends ConsumerWidget {
  List<CommentDTO> commentList;
  int index;
  bool isReReply;

  WebtoonReplyBody({required this.commentList, required this.index, this.isReReply = false});

  //TODO: 대댓글 ExpansionTile 사용

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.fromLTRB(sizePaddingLR17, sizeM10, sizePaddingLR17, sizeM10),
      child: Column(
        children: [
          Row(
            children: [
              commentList[index].isAuthor
                  ? Row(
                      children: [TitleTag(titleTagEnum: TitleTagEnum.author), SizedBox(width: 3)],
                    )
                  : commentList[index].isAdmin
                      ? Row(
                          children: [TitleTag(titleTagEnum: TitleTagEnum.admin), SizedBox(width: 3)],
                        )
                      : commentList[index].likeCommentCount - commentList[index].dislikeCommentCount >= 1
                          ? Row(
                              children: [TitleTag(titleTagEnum: TitleTagEnum.best), SizedBox(width: 3)],
                            )
                          : SizedBox(),
              Text("${commentList[index].userUsername}", style: TextStyle(fontWeight: FontWeight.bold)),
              Text(
                  "(${commentList[index].userEmail.split("@")[0].length < 4 //
                      ? commentList[index].userEmail.split("@")[0] //
                      : commentList[index].userEmail.split("@")[0].substring(0, 3)}***)",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text(
                " ${DateFormat('yyyy-MM-dd HH:mm:ss').format(commentList[index].createdAt)}",
                style: TextStyle(color: Colors.grey[600], fontSize: 13),
              ),
              Spacer(),
              InkWell(
                onTap: () {}, // TODO 삭제
                child: Icon(Icons.more_vert, color: Colors.grey[700]),
              ),
            ],
          ),
          SizedBox(height: sizeS5),
          Align(
              alignment: Alignment(-1, 0),
              child: Wrap(children: [
                Text("${commentList[index].text}"),
              ])),
          SizedBox(height: sizeS5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: isReReply == true
                    ? () {}
                    : () {
                        print("대댓글 답글보기");
                        // ParamStore ps = ref.read(paramProvider);
                        ref.read(paramProvider).addCommentDetailId((commentList[index].id));
                        Navigator.push(context, MaterialPageRoute(builder: (_) => ReReplyPage()));
                      },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: sizeS5),
                  height: sizeML20,
                  decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                  child: Row(
                    children: [
                      Text("답글 ${commentList[index].reCommentList.length == 0 ? '' : commentList[index].reCommentList.length}"),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      commentList[index].isMyLike == false && commentList[index].isMyDislike == false
                          ? ref.read(webtoonReplyProvider.notifier).notifyCommentLike(commentList[index].id)
                          : commentList[index].isMyLike == true
                              ? ref.read(webtoonReplyProvider.notifier).notifyCommentLikecancel(commentList[index].id)
                              : mySnackbar(
                                  context,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.thumb_down_outlined, color: Colors.blue[800]),
                                      Text("를 취소해야 "),
                                      Icon(Icons.thumb_up_outlined, color: Colors.red),
                                      Text("를 누를 수 있습니다."),
                                    ],
                                  ),
                                );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: sizeS5),
                      height: sizeML20,
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: Row(
                        children: [
                          commentList[index].isMyLike == true ? Icon(Icons.thumb_up_outlined, color: Colors.red) : Icon(Icons.thumb_up_outlined),
                          SizedBox(width: sizeS5),
                          Text(
                            "${commentList[index].likeCommentCount}",
                            style: TextStyle(color: commentList[index].isMyLike == true ? Colors.red : Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: sizeS5),
                  InkWell(
                    onTap: () {
                      commentList[index].isMyDislike == false && commentList[index].isMyLike == false
                          ? ref.read(webtoonReplyProvider.notifier).notifyCommentDislike(commentList[index].id)
                          : commentList[index].isMyDislike == true
                              ? ref.read(webtoonReplyProvider.notifier).notifyCommentLikecancel(commentList[index].id)
                              : mySnackbar(
                                  context,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.thumb_up_outlined, color: Colors.red),
                                      Text("를 취소해야 "),
                                      Icon(Icons.thumb_down_outlined, color: Colors.blue[800]),
                                      Text("를 누를 수 있습니다."),
                                    ],
                                  ),
                                );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: sizeS5),
                      height: sizeML20,
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: Row(
                        children: [
                          commentList[index].isMyDislike == true
                              ? Icon(Icons.thumb_down_outlined, color: Colors.blue[800])
                              : Icon(Icons.thumb_down_outlined),
                          SizedBox(width: sizeS5),
                          Text(
                            "${commentList[index].dislikeCommentCount}",
                            style: TextStyle(color: commentList[index].isMyDislike == true ? Colors.blue[800] : Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
