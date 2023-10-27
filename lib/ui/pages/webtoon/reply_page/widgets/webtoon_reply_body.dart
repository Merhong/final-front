import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/dto/comment_dto/comment_DTO.dart';
import 'package:intl/intl.dart';

class WebtoonReplyBody extends StatelessWidget {
  List<CommentDTO> commentList;
  int index;

  WebtoonReplyBody(this.commentList, this.index);

  //TODO: 대댓글 ExpansionTile 사용

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.circle,
                color: Colors.red,
              ),
              Container(
                child: commentList[index].isAuthor ? Text("작가") : Text("작가아님"),
              ),
              Text("${commentList[index].userUsername}"),
              Text("(${commentList[index].userEmail.split("@")[0].length < 4 //
                  ? commentList[index].userEmail.split("@")[0] //
                  : commentList[index].userEmail.split("@")[0].substring(0, 4)}****)"),
              Text(
                  "${DateFormat('yyyy-MM-dd HH:mm:ss').format(commentList[index].createdAt)}"),
            ],
          ),
          Align(
              alignment: Alignment(-1, 0),
              child: Text("${commentList[index].text}")),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: Container(
                  // height: sizeML20,
                  // width: sizeXL50,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                        "답글 ${commentList[index].reCommentList.length == 0 ? '' : commentList[index].reCommentList.length}"),
                  ),
                ),
              ),
              Row(
                children: [
                  InkWell(
                    child: Container(
                      height: sizeML20,
                      width: sizeXML80,
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: Row(
                        children: [
                          Icon(Icons.thumb_up_outlined),
                          Text("${commentList[index].likeCommentCount}"),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: sizeM10),
                  InkWell(
                    child: Container(
                      height: sizeML20,
                      width: sizeXL50,
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: Row(
                        children: [
                          Icon(Icons.thumb_down_outlined),
                          Text("${commentList[index].dislikeCommentCount}"),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
