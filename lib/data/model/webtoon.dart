import 'package:flutter_blog/data/model/Author.dart';
import 'package:flutter_blog/data/model/episode.dart';

class Webtoon {
  final int id;

  // final Author author;
  final List<Author> authorList;
  final String title;
  List<Episode>? episodeList;
  String? intro;
  double? starScore;
  double? starCount;
  String? image;
  String? detailImage;
  int? ageLimit;
  String? weekDay;
  String? specially;
  DateTime? createdAt;
  DateTime? updatedAt;

  Webtoon({
    required this.id,
    required this.authorList,
    required this.title,
    this.episodeList,
    this.intro,
    this.starScore,
    this.starCount,
    this.image,
    this.detailImage,
    this.ageLimit,
    this.weekDay,
    this.specially,
    this.createdAt,
    this.updatedAt,
  });

  // Map 형태로 받아서 Dart 객체로 변환합니다.
  Webtoon.fromDetailJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        intro = json["intro"],
        starScore = json["starScore"],
        starCount = json["starCount"],
        image = json["image"],
        ageLimit = json["ageLimit"],
        weekDay = json["weekDay"],
        specially = json["specially"],
        // author = Author.fromJson(json["authorDTO"]),
        authorList = (json["authorList"] as List)
            .map((jsonAuthor) => Author.fromJson(jsonAuthor))
            .toList(),
        episodeList = (json["episodeList"] as List)
            .map((jsonEpisode) => Episode.fromJson(jsonEpisode))
            .toList();

  Webtoon.fromHomeJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        starScore = json["starScore"],
        starCount = json["starCount"],
        image = json["image"],
        ageLimit = json["ageLimit"],
        specially = json["specially"],
        weekDay = json["weekDay"],
        authorList = (json["authorList"] as List)
            .map((jsonAuthor) => Author.fromJson(jsonAuthor))
            .toList();

  @override
  String toString() {
    return 'Webtoon{id: $id, authorList: $authorList, title: $title, episodeList: $episodeList, intro: $intro, starScore: $starScore, starCount: $starCount, image: $image, detailImage: $detailImage, ageLimit: $ageLimit, weekDay: $weekDay, specially: $specially, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}
