import 'package:flutter/material.dart';
import 'package:flutter_blog/data/dto/comment_dto/comment_DTO.dart';
import 'package:flutter_blog/ui/pages/webtoon/reply_page/webtoon_reply_view_model.dart';
import 'package:flutter_blog/ui/pages/webtoon/reply_page/widgets/webtoon_reply_app_bar.dart';
import 'package:flutter_blog/ui/pages/webtoon/reply_page/widgets/webtoon_reply_body.dart';
import 'package:flutter_blog/ui/pages/webtoon/reply_page/widgets/webtoon_reply_bottom_app_bar.dart';
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
  const ReplyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WebtoonReplyModel? model = ref.watch(webtoonReplyProvider);

    if (model == null) {
      return Center(child: CircularProgressIndicator());
    }

    List<CommentDTO> commentList = model!.commentList;

    return Scaffold(
        bottomNavigationBar: WebtoonReplyBottomAppBar(),
        appBar: WebtoonReplyAppBar(
          commentAmount: commentList.length,
        ),
        body: ListView.separated(
            itemBuilder: (context, index) {
              return WebtoonReplyBody(commentList, index);
            },
            separatorBuilder: (context, index) =>
                Divider(height: 1, color: Colors.grey),
            itemCount: commentList.length)

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
