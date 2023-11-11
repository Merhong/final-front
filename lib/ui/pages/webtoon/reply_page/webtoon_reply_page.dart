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

class ReplyPage extends ConsumerStatefulWidget {
  ReplyPage({super.key});

  @override
  _ReplyPageState createState() => _ReplyPageState();
}

class _ReplyPageState extends ConsumerState<ReplyPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final refreshKey = GlobalKey<RefreshIndicatorState>();

  late bool isLikeSort;

  @override
  void initState() {
    print("인잇스테이트실행");
    isLikeSort = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            child: Column(
              children: [
                Container(
                  height: 45,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          print("등록순정렬");
                          isLikeSort = false;
                          commentList.sort((a, b) => b.createdAt.compareTo(a.createdAt));
                          setState(() {});
                        },
                        child: Text(
                          "등록 순",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: isLikeSort == false ? Colors.green : Colors.black),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          print("좋아요순정렬");
                          isLikeSort = true;
                          commentList.sort((a, b) => b.likeCommentCount.compareTo(a.likeCommentCount));
                          setState(() {});
                        },
                        child: Text(
                          "좋아요 순",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: isLikeSort == true ? Colors.green : Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(color: Colors.grey, height: 1, thickness: 1),
                commentList.length == 0
                    ? Container(
                        height: 70,
                        child: Center(child: Text("아직 댓글이 없어요.")),
                      )
                    : SizedBox(),
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        if (index == commentList.length) {
                          return SizedBox(height: 60);
                        }
                        return WebtoonReplyBody(commentList: commentList, index: index);
                      },
                      separatorBuilder: (context, index) => Divider(color: Colors.grey, height: 1, thickness: 1),
                      itemCount: commentList.length + 1),
                ),
              ],
            ),
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
