import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/webtoon/episode_page/widgets/webtoon_episode_rating_star_lib.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RatingStarInkwell extends StatefulWidget {
  final WidgetRef ref;
  RatingStarInkwell({
    required this.ref,
    Key? key, // key 매개변수를 수정
  }) : super(key: key); // super 키워드를 사용하여 key를 전달

  @override
  State<RatingStarInkwell> createState() => _RatingStarInkwell();
}

class _RatingStarInkwell extends State<RatingStarInkwell> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('별점 주기'),
              content: RatingStarsLib(
                ref: widget.ref,
              ),
            );
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(border: Border.all()),
        child: Padding(
          padding: EdgeInsets.all(2),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 20.0,
              ),
              Text("별점주기"),
            ],
          ),
        ),
      ),
    );
  }
}
