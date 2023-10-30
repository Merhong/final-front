import 'package:flutter_blog/data/model/author.dart';
import 'package:flutter_blog/data/model/episode.dart';
import 'package:intl/intl.dart';

class InterestWebtoonDTO {
  int id;
  int userId;
  int webtoonId;
  String? webtoonImage;
  bool isAlarm;
  DateTime? webtoonUpdateAt;
  DateTime createdAt;

  InterestWebtoonDTO(this.id, this.userId, this.webtoonId, this.webtoonImage, this.isAlarm, this.webtoonUpdateAt, this.createdAt);

  // Map 형태로 받아서 Dart 객체로 변환합니다.
  InterestWebtoonDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        userId = json["userId"],
        webtoonId = json["webtoonId"],
        webtoonImage = json["webtoonImage"],
        isAlarm = json["isAlarm"],
        webtoonUpdateAt = json["webtoonUpdateAt"] == null ? null : DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ").parse(json["webtoonUpdateAt"]),
        createdAt = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ").parse(json["createdAt"]);

  @override
  String toString() {
    return 'InterestWebtoonDTO{id: $id, userId: $userId, webtoonId: $webtoonId, webtoonImage: $webtoonImage, isAlarm: $isAlarm, webtoonUpdateAt: $webtoonUpdateAt, createdAt: $createdAt}';
  }
}
