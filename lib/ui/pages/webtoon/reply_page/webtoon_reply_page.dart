import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/_core/utils/validator_util.dart';
import 'package:flutter_blog/data/dto/comment_dto/comment_DTO.dart';
import 'package:flutter_blog/ui/pages/webtoon/episode_page/widgets/webtoon_episode_bottom_bar.dart';
import 'package:flutter_blog/ui/pages/webtoon/reply_page/webtoon_reply_view_model.dart';
import 'package:flutter_blog/ui/pages/webtoon/reply_page/widgets/webtoon_reply_app_bar.dart';
import 'package:flutter_blog/ui/pages/webtoon/reply_page/widgets/webtoon_reply_body.dart';
import 'package:flutter_blog/ui/pages/webtoon/reply_page/widgets/webtoon_reply_write.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReplyPage extends ConsumerWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final refreshKey = GlobalKey<RefreshIndicatorState>();

  ReplyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WebtoonReplyModel? model = ref.watch(webtoonReplyProvider);

    if (model == null) {
      return Center(child: CircularProgressIndicator());
    }

    List<CommentDTO> commentList = model!.commentList;

    return Scaffold(
        appBar: ReplyAppBar(commentList.length),
        bottomSheet: WebtoonReplyWrite(),
        body: RefreshIndicator(
          key: refreshKey,
          onRefresh: () async {
            print("리플래시됨");
            await ref.read(webtoonReplyProvider.notifier).notifyInit();
          },
          child: GestureDetector(
            onTap: () {
              print("제스처작동 키보드내리기");
              FocusScope.of(context).unfocus();
            },
            child: ListView.separated(
                itemBuilder: (context, index) {
                  if (index == commentList.length) {
                    return SizedBox(height: 70);
                  }
                  return WebtoonReplyBody(commentList: commentList, index: index);
                },
                separatorBuilder: (context, index) => Divider(height: 1, color: Colors.grey),
                itemCount: commentList.length + 1),
          ),
        )

        // WebtoonReplyBody(),
        // ReplyTabBar(),
        // bottomNavigationBar: WebtoonEpisodeBottomBar(),
        );
  }
}

// class Card extends StatefulWidget {
//   int index;
//   Card(this.index);
//
//   @override
//   State<Card> createState() => _CardState();
// }

// class _CardState extends State<Card> {
//   bool isShow = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         ListTile(
//           title: Text("제목${widget.index}"),
//           trailing: IconButton(
//             icon: Icon(Icons.arrow_drop_down),
//             onPressed: () {
//               setState(() {
//                 isShow = !isShow;
//               });
//             },
//           ),
//         ), // Stateful 부모 클래스 값 접근법
//         AnimatedContainer(
//           duration: const Duration(milliseconds: 350),
//           curve: Curves.fastOutSlowIn,
//           height: isShow ? 100 : 0,
//           decoration: BoxDecoration(color: Colors.grey[200]),
//         )
//       ],
//     );
//   }
// }
