import 'package:flutter_blog/data/model/author.dart';
import 'package:intl/intl.dart';

class InterestWebtoonDTO {
  int id;
  int userId;
  int webtoonId;
  String? webtoonTitle;
  String? webtoonImage;
  String? webtoonSpeciallyEnum;
  bool isAlarm;
  DateTime? webtoonUpdateAt;
  DateTime createdAt;

  InterestWebtoonDTO(this.webtoonSpeciallyEnum, this.id, this.userId, this.webtoonId, this.webtoonTitle, this.webtoonImage, this.isAlarm,
      this.webtoonUpdateAt, this.createdAt);

  // Map 형태로 받아서 Dart 객체로 변환합니다.
  InterestWebtoonDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        userId = json["userId"],
        webtoonId = json["webtoonId"],
        webtoonTitle = json["webtoonTitle"],
        webtoonImage = json["webtoonImage"],
        isAlarm = json["isAlarm"],
        webtoonSpeciallyEnum = json["webtoonSpeciallyEnum"] == null ? "없음" : json["webtoonSpeciallyEnum"],
        webtoonUpdateAt = json["webtoonUpdateAt"] == null ? null : DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ").parse(json["webtoonUpdateAt"]),
        createdAt = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ").parse(json["createdAt"]);

  @override
  String toString() {
    return 'InterestWebtoonDTO{id: $id, userId: $userId, webtoonId: $webtoonId, webtoonTitle: $webtoonTitle, webtoonImage: $webtoonImage, webtoonSpeciallyEnum: $webtoonSpeciallyEnum, isAlarm: $isAlarm, webtoonUpdateAt: $webtoonUpdateAt, createdAt: $createdAt}';
  }
}
