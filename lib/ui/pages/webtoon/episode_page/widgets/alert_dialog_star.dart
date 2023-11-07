import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/webtoon/episode_page/webtoon_episode_view_model.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AlertDialogStar extends ConsumerStatefulWidget {
  const AlertDialogStar({
    super.key,
  });

  @override
  _AlertDialogStarState createState() => _AlertDialogStarState();
}

class _AlertDialogStarState extends ConsumerState<AlertDialogStar> {
  double value = 1;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('별점 주기'),
      content: Container(
        height: 100,
        child: Column(
          children: [
            RatingStars(
              value: value,
              onValueChanged: (v) {
                //
                setState(() {
                  value = v;
                });
                print("onValueChanged:value${value}");
              },
              starBuilder: (index, color) => Icon(
                Icons.star,
                color: color,
                size: 30,
              ),
              starCount: 5,
              starSize: 30,
              valueLabelColor: const Color(0xff9b9b9b),
              valueLabelTextStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontStyle: FontStyle.normal, fontSize: 15),
              valueLabelRadius: 10,
              maxValue: 5,
              starSpacing: 1,
              maxValueVisibility: true,
              valueLabelVisibility: true,
              animationDuration: Duration(milliseconds: 1000),
              valueLabelPadding: const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
              valueLabelMargin: const EdgeInsets.only(right: 8),
              starOffColor: const Color(0xffe7e8ea),
              starColor: Colors.yellow,
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("취소"),
                ),
                ElevatedButton(
                  onPressed: () {
                    print("별점주기버튼누름 value:${value.toInt()}");
                    ref.watch(webtoonEpisodeProvider.notifier).starEpisode(value.toInt());
                    Navigator.pop(context);
                  },
                  child: Text("실행"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
