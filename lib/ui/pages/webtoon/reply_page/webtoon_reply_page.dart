import 'package:flutter/material.dart';
import 'package:flutter_blog/data/dto/comment_dto/comment_DTO.dart';
import 'package:flutter_blog/ui/pages/webtoon/episode_page/widgets/webtoon_episode_bottom_bar.dart';
import 'package:flutter_blog/ui/pages/webtoon/reply_page/webtoon_reply_view_model.dart';
import 'package:flutter_blog/ui/pages/webtoon/reply_page/widgets/webtoon_episode_reply_app_bar.dart';
import 'package:flutter_blog/ui/pages/webtoon/reply_page/widgets/webtoon_episode_reply_body.dart';
import 'package:flutter_blog/ui/pages/webtoon/reply_page/widgets/wetoon_episode_reply_tab_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// class WebtoonReplyPage extends StatelessWidget {
//   WebtoonReplyPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: ReplyPage(),
//     );
//   }
// }

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
        appBar: ReplyAppBar(),
        body: RefreshIndicator(
          key: refreshKey,
          onRefresh: () async {
            print("리플래시됨");
            await ref.read(webtoonReplyProvider.notifier).notifyInit();
          },
          child: ListView.separated(
              itemBuilder: (context, index) {
                return WebtoonReplyBody(commentList, index);
              },
              separatorBuilder: (context, index) => Divider(height: 1, color: Colors.grey),
              itemCount: commentList.length),
        )

        // WebtoonReplyBody(),
        // ReplyTabBar(),
        // bottomNavigationBar: WebtoonEpisodeBottomBar(),
        );
  }
}

class Card extends StatefulWidget {
  int index;
  Card(this.index);

  @override
  State<Card> createState() => _CardState();
}

class _CardState extends State<Card> {
  bool isShow = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text("제목${widget.index}"),
          trailing: IconButton(
            icon: Icon(Icons.arrow_drop_down),
            onPressed: () {
              setState(() {
                isShow = !isShow;
              });
            },
          ),
        ), // Stateful 부모 클래스 값 접근법
        AnimatedContainer(
          duration: const Duration(milliseconds: 350),
          curve: Curves.fastOutSlowIn,
          height: isShow ? 100 : 0,
          decoration: BoxDecoration(color: Colors.grey[200]),
        )
      ],
    );
  }
}
