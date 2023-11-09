import 'package:flutter_blog/data/model/author.dart';
import 'package:intl/intl.dart';

class InterestAuthorAddDTO {
  int id;
  int userId;
  int authorId;
  bool isAlarm;
  DateTime createdAt;

  InterestAuthorAddDTO(this.id, this.userId, this.authorId, this.isAlarm, this.createdAt);

  // Map 형태로 받아서 Dart 객체로 변환합니다.
  InterestAuthorAddDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        userId = json["userId"],
        authorId = json["authorId"],
        isAlarm = json["isAlarm"],
        createdAt = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ").parse(json["createdAt"]);

  @override
  String toString() {
    return 'InterestAuthorAddDTO{id: $id, userId: $userId, authorId: $authorId, isAlarm: $isAlarm, createdAt: $createdAt}';
  }
}
