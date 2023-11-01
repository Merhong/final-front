import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/dto/user_dto/my_comment_DTO.dart';
import 'package:flutter_blog/ui/common_widgets/title_tag.dart';
import 'package:flutter_blog/ui/pages/other/my_page/my_comment_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../../common_widgets/comment_box.dart';

class MyComment extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MyCommentPageModel? model = ref.watch(myCommentPageProvider);
    if (model == null) {
      return Center(child: CircularProgressIndicator());
    }
    List<MyCommentDTO> myCommentDTOList = model.myCommentDTOList;

    return Column(
      children: [
        buildMyCommentTopMenu(),
        buildMyCommentCount(),
        Divider(color: Colors.grey, height: 1),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(color: Colors.grey, height: 1),
            itemCount: myCommentDTOList.length,
            itemBuilder: (context, index) {
              return buildCommentDescription(myCommentDTOList[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget buildCommentDescription(MyCommentDTO myCommentDTO) {
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
                    print("my댓글에서 삭제버튼");
                  },
                  child: Icon(Icons.close, color: Colors.grey[500]))
            ],
          ),
          Row(children: [
            TitleTag(titleTagEnum: TitleTagEnum.reReply),
            SizedBox(width: 3),
            Text("${myCommentDTO.text}"),
          ]),
          SizedBox(height: 5),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  "${imageURL}/EpisodeThumbnail/${myCommentDTO.episodeThumbnail}",
                  width: 70,
                  height: 40,
                  fit: BoxFit.fill,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset("assets/default_episode_Thumbnail.jpg", width: 70, height: 40, fit: BoxFit.fill);
                  },
                ),
              ),
              SizedBox(width: 10),
              Row(children: [
                Text("[${myCommentDTO.webtoonTitle}] ${myCommentDTO.episodeTitle}",
                    style: TextStyle(color: Colors.grey[600], fontSize: 12, overflow: TextOverflow.ellipsis)),
                Text(" >", style: TextStyle(color: Colors.grey[600], fontSize: 15)),
              ]),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              InkWell(
                // onTap: isReReply == true
                //     ? () {}
                //     : () {
                //         print("대댓글 답글보기");
                //         // ParamStore ps = ref.read(paramProvider);
                //         ref.read(paramProvider).addCommentDetailId((commentList[index].id));
                //         Navigator.push(context, MaterialPageRoute(builder: (_) => ReReplyPage()));
                //       },
                child: CommentBox(
                  commentBoxRow: Row(children: [Text("답글${myCommentDTO.reCommentCount == 0 ? '' : myCommentDTO.reCommentCount}")]),
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Icon(Icons.thumb_up_outlined),
                  SizedBox(width: 3),
                  Text("${myCommentDTO.dislikeCommentCount}"),
                ],
              ),
              SizedBox(width: sizeL20),
              Row(
                children: [
                  Icon(Icons.thumb_down_outlined),
                  SizedBox(width: 3),
                  Text("${myCommentDTO.dislikeCommentCount}"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding buildMyCommentCount() {
    return Padding(
      padding: EdgeInsets.fromLTRB(sizePaddingLR17, 0, sizePaddingLR17, sizeM10),
      child: Container(
        padding: EdgeInsets.all(sizeM10),
        decoration: BoxDecoration(color: Colors.grey[300]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(children: [Text('총 댓글 수'), Text('1', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))]),
            Container(color: Colors.grey[500], width: 1, height: 30),
            Column(children: [Text('총 답글 수'), Text('1', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))]),
            Container(color: Colors.grey[500], width: 1, height: 30),
            Column(children: [Text('받은 좋아요 수'), Text('1', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))]),
          ],
        ),
      ),
    );
  }

  Container buildMyCommentTopMenu() {
    return Container(
      padding: EdgeInsets.fromLTRB(sizePaddingLR17, sizeM10, sizePaddingLR17, sizeM10),
      child: Row(
        children: [
          Text("웹툰 3", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          SizedBox(width: sizeL20),
          Text("베도/도전 0", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          SizedBox(width: sizeL20),
          Text("최신순", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          Text("▼"),
          Spacer(),
          InkWell(child: Icon(Icons.warning_amber, size: 20)),
        ],
      ),
    );
  }
}
