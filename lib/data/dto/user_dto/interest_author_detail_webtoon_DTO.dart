import 'package:intl/intl.dart';

class InterestAuthorDetailWebtoonDTO {
  int id;
  String? title;
  String? image;
  String? webtoonSpeciallyEnum;
  DateTime? episodeUpdatedAt;

  InterestAuthorDetailWebtoonDTO(
    this.id,
    this.title,
    this.image,
    this.webtoonSpeciallyEnum,
    this.episodeUpdatedAt,
  );

  // Map 형태로 받아서 Dart 객체로 변환합니다.
  InterestAuthorDetailWebtoonDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        image = json["image"],
        webtoonSpeciallyEnum = json["webtoonSpeciallyEnum"],
        episodeUpdatedAt = json["episodeUpdatedAt"] == null ? null : DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ").parse(json["episodeUpdatedAt"]);

  @override
  String toString() {
    return 'InterestAuthorDetailWebtoonDTO{id: $id, title: $title, image: $image, webtoonSpeciallyEnum: $webtoonSpeciallyEnum, episodeUpdatedAt: $episodeUpdatedAt}';
  }
}
