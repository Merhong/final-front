import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/dto/comment_dto/comment_DTO.dart';
import 'package:flutter_blog/data/provider/param_provider.dart';
import 'package:flutter_blog/data/provider/session_provider.dart';
import 'package:flutter_blog/ui/common_widgets/comment_box.dart';
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.fromLTRB(sizePaddingLR17, sizeM10, sizePaddingLR17, sizeM10),
      child: Column(
        children: [
          commentList[index].isDelete == true
              ? Row(children: [Text("삭제된 댓글입니다.", style: TextStyle(fontWeight: FontWeight.bold))])
              : buildNameAndTime(context, ref),
          SizedBox(height: sizeS5),
          buildText(),
          SizedBox(height: sizeS5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildReCommentButton(context, ref),
              buildLikeButton(context, ref),
            ],
          ),
        ],
      ),
    );
  }

  Row buildLikeButton(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            ScaffoldMessenger.of(context).clearSnackBars();
            commentList[index].isDelete == true
                ? mySnackbar(
                    context,
                    1000,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("삭제된 댓글은 "),
                        Icon(Icons.thumb_up_outlined, color: Colors.red),
                        Text("할 수 없습니다."),
                      ],
                    ),
                  )
                : commentList[index].isMyLike == false && commentList[index].isMyDislike == false
                    ? ref.read(webtoonReplyProvider.notifier).notifyCommentLike(commentList[index].id)
                    : commentList[index].isMyLike == true
                        ? ref.read(webtoonReplyProvider.notifier).notifyCommentLikecancel(commentList[index].id)
                        : mySnackbar(
                            context,
                            1000,
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
          child: CommentBox(
              commentBoxRow: Row(
            children: [
              commentList[index].isMyLike == true ? Icon(Icons.thumb_up_outlined, color: Colors.red) : Icon(Icons.thumb_up_outlined),
              SizedBox(width: sizeS5),
              Text("${commentList[index].likeCommentCount}",
                  style: TextStyle(color: commentList[index].isMyLike == true ? Colors.red : Colors.black)),
            ],
          )),
        ),
        SizedBox(width: sizeS5),
        InkWell(
          onTap: () {
            ScaffoldMessenger.of(context).clearSnackBars();
            commentList[index].isDelete == true
                ? mySnackbar(
                    context,
                    1000,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("삭제된 댓글은 "),
                        Icon(Icons.thumb_down_outlined, color: Colors.blue[800]),
                        Text("할 수 없습니다."),
                      ],
                    ),
                  )
                : commentList[index].isMyDislike == false && commentList[index].isMyLike == false
                    ? ref.read(webtoonReplyProvider.notifier).notifyCommentDislike(commentList[index].id)
                    : commentList[index].isMyDislike == true
                        ? ref.read(webtoonReplyProvider.notifier).notifyCommentLikecancel(commentList[index].id)
                        : mySnackbar(
                            context,
                            1000,
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
          child: CommentBox(
              commentBoxRow: Row(
            children: [
              commentList[index].isMyDislike == true ? Icon(Icons.thumb_down_outlined, color: Colors.blue[800]) : Icon(Icons.thumb_down_outlined),
              SizedBox(width: sizeS5),
              Text("${commentList[index].dislikeCommentCount}",
                  style: TextStyle(color: commentList[index].isMyDislike == true ? Colors.blue[800] : Colors.black)),
            ],
          )),
        ),
      ],
    );
  }

  InkWell buildReCommentButton(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: isReReply == true
          ? () {}
          : () {
              print("대댓글보기");
              // ParamStore ps = ref.read(paramProvider);
              ref.read(paramProvider).addCommentDetailId((commentList[index].id));
              Navigator.push(context, MaterialPageRoute(builder: (_) => ReReplyPage()));
            },
      child: CommentBox(
          commentBoxRow: Row(
        children: [Text("답글${commentList[index].reCommentList.length == 0 ? '' : ' ${commentList[index].reCommentList.length}'}")],
      )),
    );
  }

  Align buildText() {
    return Align(
        alignment: Alignment(-1, 0),
        child: Wrap(children: [
          commentList[index].isDelete == true ? SizedBox() : Text("${commentList[index].text}"),
        ]));
  }

  Row buildNameAndTime(BuildContext context, WidgetRef ref) {
    return Row(
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
          onTap: () {
            ScaffoldMessenger.of(context).clearSnackBars();

            commentList[index].userId != ref.read(sessionProvider).user!.id
                ? mySnackbar(
                    context,
                    1000,
                    Row(children: [Text("내 댓글만 삭제할 수 있습니다.")], mainAxisAlignment: MainAxisAlignment.center),
                  )
                : mySnackbar(
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
                            ref.read(webtoonReplyProvider.notifier).notifyCommentDelete(commentList[index].id);
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
          child: Icon(Icons.more_vert, color: Colors.grey[700]),
        ),
      ],
    );
  }
}
