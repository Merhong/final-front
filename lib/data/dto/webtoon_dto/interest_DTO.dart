import 'package:flutter_blog/data/model/Author.dart';
import 'package:flutter_blog/data/model/episode.dart';
import 'package:intl/intl.dart';

class InterestDTO {
  int id;
  bool isAlarm;
  DateTime createdAt;
  int userId;
  int webtoonId;
  int webtoonTotalInterest;

  InterestDTO(this.id, this.isAlarm, this.createdAt, this.userId, this.webtoonId, this.webtoonTotalInterest);

  // Map 형태로 받아서 Dart 객체로 변환합니다.
  InterestDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        isAlarm = json["isAlarm"],
        createdAt = DateFormat("yyyy-mm-dd").parse(json["createdAt"]),
        userId = json["userId"],
        webtoonId = json["webtoonId"],
        webtoonTotalInterest = json["webtoonTotalInterest"];

  @override
  String toString() {
    return 'InterestDto{id: $id, isAlarm: $isAlarm, createdAt: $createdAt, userId: $userId, webtoonId: $webtoonId, webtoonTotalInterest: $webtoonTotalInterest}';
  }
}
