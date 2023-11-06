import 'package:flutter/material.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/ui/pages/webtoon/episode_page/webtoon_episode_rating_star_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class RatingStarAlert extends ConsumerWidget {
  const RatingStarAlert({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WebtoonEpisodeRatingStarModel model = ref.watch(webtoonEpisodeRatingStarProvider);

    int star = model.numberOfStar;
    // Logger().d("디버그1", star);

    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return Builder(builder: (context) {
              return AlertDialog(
                title: Text("별점주기  ${model.numberOfStar}"),
                content: Row(
                  children: [
                    Row(
                      children: [
                        for (int i = 0; i < star; i++) _star(1, ref, i + 1),
                        for (int j = 0; j < 5 - star; j++) _star(-1, ref, j + 1),
                      ],
                    ),
                  ],
                ),
                actions: <Widget>[
                  ElevatedButton(
                    child: Text("취소"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  ElevatedButton(
                    child: Text("확인"),
                    onPressed: () async {
                      ResponseDTO responseDTO = await ref.read(webtoonEpisodeRatingStarProvider.notifier).notifyRatingStars();

                      responseDTO.success == true ? Navigator.of(context).pop() : AlertDialog(title: responseDTO.data);

                      // 여기에서 각 별점을 처리하거나 다른 작업을 수행할 수 있습니다.
                    },
                  ),
                ],
              );
            });
          },
        );
      },
      // child: Container(
      //   decoration: BoxDecoration(border: Border.all()),
      //   child: Padding(
      //     padding: EdgeInsets.all(2),
      //     child: Row(
      //       children: <Widget>[
      //         Icon(
      //           Icons.star,
      //           color: Colors.yellow,
      //           size: 20.0,
      //         ),
      //         Text("별점주기"),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}

IconButton _star(int value, WidgetRef ref, int currentIndex) {
  return IconButton(
    icon: Icon(Icons.star),
    iconSize: 36.0,
    color: value == 1 ? Colors.yellow : Colors.grey,
    //1 :  yellow, -1 :  grey

    onPressed: () {
      ref.read(webtoonEpisodeRatingStarProvider.notifier).notifyNumberOfStars(currentIndex);
    },
  );
}
