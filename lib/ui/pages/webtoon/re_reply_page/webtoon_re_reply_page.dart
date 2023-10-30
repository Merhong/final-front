import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/dto/comment_dto/comment_DTO.dart';
import 'package:flutter_blog/data/provider/param_provider.dart';
import 'package:flutter_blog/ui/pages/webtoon/re_reply_page/widgets/webtoon_re_reply_appbar.dart';
import 'package:flutter_blog/ui/pages/webtoon/re_reply_page/widgets/webtoon_re_reply_body.dart';
import 'package:flutter_blog/ui/pages/webtoon/re_reply_page/widgets/webtoon_re_reply_write.dart';
import 'package:flutter_blog/ui/pages/webtoon/reply_page/webtoon_reply_view_model.dart';
import 'package:flutter_blog/ui/pages/webtoon/reply_page/widgets/webtoon_episode_reply_app_bar.dart';
import 'package:flutter_blog/ui/pages/webtoon/reply_page/widgets/webtoon_episode_reply_body.dart';
import 'package:flutter_blog/ui/pages/webtoon/reply_page/widgets/webtoon_reply_write.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReReplyPage extends ConsumerWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final refreshKey = GlobalKey<RefreshIndicatorState>();

  ReReplyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WebtoonReplyModel? model = ref.watch(webtoonReplyProvider);

    if (model == null) {
      return Center(child: CircularProgressIndicator());
    }

    ParamStore ps = ref.read(paramProvider);
    int? commentId = ps.commentId;

    // List<CommentDTO> commentList = model!.commentList;

    CommentDTO commentDTO = model.commentList.firstWhere((e) => e.id == commentId);

    return Scaffold(
      appBar: WebtoonReReplyAppBar(commentDTO.reCommentList.length),
      bottomSheet: WebtoonReReplyWrite(),
      body: RefreshIndicator(
        key: refreshKey,
        onRefresh: () async {
          print("리플래시됨");
          await ref.read(webtoonReplyProvider.notifier).notifyInit();
        },
        child: GestureDetector(
          onTap: () {
            print("제스처작동");
            FocusScope.of(context).unfocus();
          },
          child: ListView.separated(
              itemBuilder: (context, index) {
                if (index == commentDTO.reCommentList.length + 1) {
                  return SizedBox(height: 70);
                }
                if (index == 0) {
                  return WebtoonReplyBody(commentList: [commentDTO], index: index, isReReply: true);
                }
                return WebtoonReReplyBody(reCommentList: commentDTO.reCommentList, index: index - 1);
                // return Text("${commentDTO.reCommentList[index - 1]}");
              },
              separatorBuilder: (context, index) => Divider(height: 1, color: Colors.grey),
              itemCount: commentDTO.reCommentList.length + 2),
        ),
      ),
    );
  }
}
