import 'package:flutter_blog/data/model/episode.dart';
import 'package:intl/intl.dart';

class Webtoon {
  final int id;
  final String title;
  final String author;
  double? starCount;
  String? image;
  int? age;
  String? weekDay;
  String? intro;
  String? hashtag;
  String? specially;
  int? likeCount;
  List<Episode>? episodeList;

  Webtoon({
    required this.id,
    required this.title,
    required this.author,
    this.starCount,
    this.image,
    this.age,
    this.weekDay,
    this.intro,
    this.hashtag,
    this.specially,
    this.likeCount,
    this.episodeList,
  });

  // Map 형태로 받아서 Dart 객체로 변환합니다.
  Webtoon.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        author = json["author"],
        starCount = json["starCount"],
        image = json["image"],
        age = json["age"],
        weekDay = json["weekDay"],
        intro = json["intro"],
        specially = json["specially"],
        hashtag = json["hashtag"],
        likeCount = json["likeCount"],
        episodeList = (json["episodeList"] as List).map((jsonEp) => Episode.fromJson(jsonEp)).toList();

  Webtoon.fromHomeJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        author = json["author"],
        starCount = json["starCount"],
        image = json["image"],
        age = json["age"],
        specially = json["specially"],
        weekDay = json["weekDay"];

  @override
  String toString() {
    return 'Webtoon{id: $id, title: $title, author: $author, starCount: $starCount, image: $image, age: $age, weekDay: $weekDay, intro: $intro, hashtag: $hashtag, specially: $specially, likeCount: $likeCount, episodeList: $episodeList}';
  }
}
