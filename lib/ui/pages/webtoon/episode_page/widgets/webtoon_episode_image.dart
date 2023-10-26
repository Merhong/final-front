import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/dto/episode_dto/episode_DTO.dart';
import 'package:flutter_blog/data/model/episode_photo.dart';

class WebtoonEpisodeImage extends StatelessWidget {
  EpisodeDTO episodeDTO;

  WebtoonEpisodeImage(this.episodeDTO);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // scrollDirection: Axis.horizontal, // 수평 스크롤로 변경
      itemCount: episodeDTO.photoList.length + 1,
      itemBuilder: (BuildContext context, int index) {
        // print(index);
        if (index == episodeDTO.photoList.length) {
          return Column(
            children: [
              Divider(height: 1, color: Colors.grey),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "★ ${(episodeDTO.starScore / episodeDTO.starCount).toStringAsFixed(2)}",
                      style: TextStyle(color: Colors.red, fontSize: 25),
                    ),
                    Container(
                      decoration: BoxDecoration(border: Border.all()),
                      child: Padding(
                        padding: EdgeInsets.all(2),
                        child: Text("별점주기"),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(height: 1, color: Colors.grey),
              Row(
                children: [
                  // Image.network("${episodeDTO.authorImage}"),
                  Text("${episodeDTO.authorName}"),
                ],
              ),
              Text("${episodeDTO.authorText}"),
            ],
          );
        }
        return Container(
          width: sizeGetScreenWidth(context),
          child: Image.network(
            "${imageURL}EpisodePhoto/${episodeDTO.photoList[index].photoURL}",
            fit: BoxFit.contain,
          ),
        );
      },
    );

    // return PageView.builder(
    //   scrollDirection: Axis.horizontal, // 수평 스크롤로 변경
    //   itemCount: 3,
    //   itemBuilder: (BuildContext context, int index) {
    //     return Container(
    //       width: MediaQuery.of(context).size.width,
    //       height: 100.0,
    //       decoration: BoxDecoration(
    //         image: DecorationImage(
    //           image: AssetImage("assets/default_episode_Thumbnail.jpg"),
    //           fit: BoxFit.cover,
    //         ),
    //       ),
    //     );
    //   },
    // );
  }
}
