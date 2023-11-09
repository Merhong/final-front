import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/other/my_page/my_interest_author_detail_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyInterestAuthorDetailInfo extends ConsumerStatefulWidget {
  MyInterestAuthorDetailInfo(
      {super.key, required this.authorNickname, required this.authorPhoto});
  String authorNickname;
  String authorPhoto;
  @override
  _MyInterestAuthorDetailInfoState createState() =>
      _MyInterestAuthorDetailInfoState();
}

class _MyInterestAuthorDetailInfoState
    extends ConsumerState<MyInterestAuthorDetailInfo> {
  @override
  Widget build(BuildContext context) {
    print("컨슈머위젯");
    MyAuthorDetailPageModel? model = ref.watch(myAuthorDetailPageProvider);
    print("테스트1111");
    if (model == null) {
      print("테스트1.5");
      return Center(child: CircularProgressIndicator());
    }
    print("테스트2222");

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(radius: 30.0),
              SizedBox(
                width: 10,
              ),
              Text("${widget.authorNickname}"),
            ],
          ),
          SizedBox(height: 10),
          Text(
            "안녕하세요 이동건입니다!",
          )
        ],
      ),
    );
  }
}
