import 'package:flutter_blog/data/model/Author.dart';

class EndRecommendationDTO {
  final int id;
  final String title;
  final String image;
  final int episodeCount;
  final List<String> authorNicknameList;

  EndRecommendationDTO(this.id, this.title, this.image, this.episodeCount,
      this.authorNicknameList);

  EndRecommendationDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        image = json["image"],
        episodeCount = json["episodeCount"],
        authorNicknameList = (json["authorNicknameList"] as List)
            .map((e) => e.toString())
            .toList();
}
