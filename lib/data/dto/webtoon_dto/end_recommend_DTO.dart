import 'package:flutter_blog/data/model/author.dart';

class EndRecommendationDTO {
  final int id;
  final String title;
  final String image;
  final int episodeCount;
  final String intro;
  final List<String> authorNicknameList;

  EndRecommendationDTO(this.id, this.title, this.image, this.episodeCount, this.intro, this.authorNicknameList);

  EndRecommendationDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        image = json["image"],
        episodeCount = json["episodeCount"],
        intro = json["intro"],
        authorNicknameList = (json["authorNicknameList"] as List).map((e) => e.toString()).toList();

  @override
  String toString() {
    return 'EndRecommendationDTO{id:$id, title:$title, image: $image, episodeCount: $episodeCount, intro: $intro, authorNicknameList: $authorNicknameList}';
  }
}
