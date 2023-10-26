import 'package:flutter_blog/data/model/Author.dart';
import 'package:flutter_blog/data/model/episode.dart';

class DetailPageWebtoonDTO {
  final int id;
  final String title;
  final String intro;
  final List<Author> authorList;
  final List<Episode> episodeList;

  int? interestCount;

  // double? starScore;
  // double? starCount;
  String? image;
  String? detailImage;
  int? ageLimit;
  String? webtoonWeekDayEnum;
  String? webtoonSpeciallyEnum;

  // DateTime? createdAt;
  // DateTime? updatedAt;

  DetailPageWebtoonDTO(
      this.id,
      this.title,
      this.intro,
      this.episodeList,
      this.authorList,
      this.image,
      this.detailImage,
      this.ageLimit,
      this.webtoonWeekDayEnum,
      this.webtoonSpeciallyEnum,
      this.interestCount);

  // Map 형태로 받아서 Dart 객체로 변환합니다.
  DetailPageWebtoonDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        intro = json["intro"],
        image = json["image"],
        detailImage = json["detailImage"],
        ageLimit = json["ageLimit"],
        webtoonSpeciallyEnum = json["webtoonSpeciallyEnum"],
        webtoonWeekDayEnum = json["webtoonWeekDayEnum"],
        interestCount = json["interestCount"],
        authorList = (json["authorList"] as List)
            .map((jsonAuthor) => Author.fromJson(jsonAuthor))
            .toList(),
        episodeList = (json["episodeList"] as List)
            .map((jsonEpisode) => Episode.fromJson(jsonEpisode))
            .toList();

  @override
  String toString() {
    return 'DetailPageWebtoonDTO{id: $id, title: $title, intro: $intro, episodeList: $episodeList, authorList: $authorList, image: $image, detailImage: $detailImage, ageLimit: $ageLimit, webtoonWeekDayEnum: $webtoonWeekDayEnum, interestCount: $interestCount, webtoonSpeciallyEnum: $webtoonSpeciallyEnum}';
  }
}
