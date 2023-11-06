import 'package:flutter/material.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/ui/pages/webtoon/episode_page/webtoon_episode_rating_star_view_model.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
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

class RatingStarsLib extends StatefulWidget {
  final WidgetRef ref;
  const RatingStarsLib({
    required this.ref,
    Key? key,
  }) : super(key: key); // super 키워드를 사용하여 key를 전달

  @override
  State<RatingStarsLib> createState() => _RatingStarsLibState();
}

class _RatingStarsLibState extends State<RatingStarsLib> {
  double rating = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('현재 별점: $rating'),
        RatingStars(
          onValueChanged: (value) {
            setState(() {
              rating = value;
            });
          },
          value: rating,
          starCount: 5,
          starSize: 23,
          starColor: Colors.yellow,
          starOffColor: Colors.grey,
        ),
        Row(
          children: [
            ElevatedButton(
              child: Text("취소"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text("확인"),
              onPressed: () async {
                ResponseDTO responseDTO = await widget.ref
                    .read(webtoonEpisodeRatingStarProvider.notifier)
                    .notifyRatingStars();
                Navigator.of(context).pop();

                responseDTO.success == true
                    ? Navigator.of(context).pop()
                    : AlertDialog(title: responseDTO.data);

                // 여기에서 각 별점을 처리하거나 다른 작업을 수행할 수 있습니다.
              },
            ),
          ],
        )
      ],
    );
  }
}
