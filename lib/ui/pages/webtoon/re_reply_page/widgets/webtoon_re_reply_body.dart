import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/dto/comment_dto/comment_DTO.dart';
import 'package:flutter_blog/data/dto/comment_dto/re_comment_DTO.dart';
import 'package:flutter_blog/data/provider/param_provider.dart';
import 'package:flutter_blog/ui/common_widgets/my_stackbar.dart';
import 'package:flutter_blog/ui/common_widgets/title_tag.dart';
import 'package:flutter_blog/ui/pages/webtoon/re_reply_page/webtoon_re_reply_page.dart';
import 'package:flutter_blog/ui/pages/webtoon/reply_page/webtoon_reply_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class WebtoonReReplyBody extends ConsumerWidget {
  List<ReCommentDTO> reCommentList;
  int index;

  WebtoonReReplyBody({required this.reCommentList, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.fromLTRB(sizePaddingLR17, sizeM10, sizePaddingLR17, sizeM10),
      child: Column(
        children: [
          Row(
            children: [
              Text("ㄴ "),
              Text("${reCommentList[index].userUsername}", style: TextStyle(fontWeight: FontWeight.bold)),
              Text(
                  "(${reCommentList[index].userEmail.split("@")[0].length < 4 //
                      ? reCommentList[index].userEmail.split("@")[0] //
                      : reCommentList[index].userEmail.split("@")[0].substring(0, 3)}***)",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text(
                " ${DateFormat('yyyy-MM-dd HH:mm:ss').format(reCommentList[index].createdAt)}",
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
          Padding(
            padding: EdgeInsets.fromLTRB(18, 0, 0, 0),
            child: Align(
                alignment: Alignment(-1, 0),
                child: Wrap(children: [
                  Text("${reCommentList[index].text}"),
                ])),
          ),
          SizedBox(height: sizeS5),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      reCommentList[index].isMyLike == false && reCommentList[index].isMyDislike == false
                          ? ref.read(webtoonReplyProvider.notifier).notifyReCommentLike(reCommentList[index].id)
                          : reCommentList[index].isMyLike == true
                              ? ref.read(webtoonReplyProvider.notifier).notifyReCommentLikecancel(reCommentList[index].id)
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
                          reCommentList[index].isMyLike == true ? Icon(Icons.thumb_up_outlined, color: Colors.red) : Icon(Icons.thumb_up_outlined),
                          SizedBox(width: sizeS5),
                          Text(
                            "${reCommentList[index].likeReCommentCount}",
                            style: TextStyle(color: reCommentList[index].isMyLike == true ? Colors.red : Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: sizeS5),
                  InkWell(
                    onTap: () {
                      reCommentList[index].isMyDislike == false && reCommentList[index].isMyLike == false
                          ? ref.read(webtoonReplyProvider.notifier).notifyReCommentDislike(reCommentList[index].id)
                          : reCommentList[index].isMyDislike == true
                              ? ref.read(webtoonReplyProvider.notifier).notifyReCommentLikecancel(reCommentList[index].id)
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
                          reCommentList[index].isMyDislike == true
                              ? Icon(Icons.thumb_down_outlined, color: Colors.blue[800])
                              : Icon(Icons.thumb_down_outlined),
                          SizedBox(width: sizeS5),
                          Text(
                            "${reCommentList[index].dislikeReCommentCount}",
                            style: TextStyle(color: reCommentList[index].isMyDislike == true ? Colors.blue[800] : Colors.black),
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
