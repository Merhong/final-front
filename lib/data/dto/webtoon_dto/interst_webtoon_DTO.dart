//TODO 유저꺼 써야함

// import 'package:flutter_blog/data/model/author.dart';
// import 'package:flutter_blog/data/model/episode.dart';
// import 'package:intl/intl.dart';
//
// class InterestWebtoonDTO {
//   int id;
//   int userId;
//   int webtoonId;
//   bool isAlarm;
//   String webtoonImage;
//   DateTime webtoonEpisodeUpdateAt;
//   DateTime createdAt;
//
//   InterestWebtoonDTO(this.id, this.isAlarm, this.createdAt, this.userId, this.webtoonId, this.webtoonEpisodeUpdateAt, this.webtoonImage);
//
//   // Map 형태로 받아서 Dart 객체로 변환합니다.
//   InterestWebtoonDTO.fromJson(Map<String, dynamic> json)
//       : id = json["id"],
//         userId = json["userId"],
//         webtoonId = json["webtoonId"],
//         isAlarm = json["isAlarm"],
//         webtoonImage = json["webtoonImage"],
//         webtoonEpisodeUpdateAt = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ").parse(json["webtoonEpisodeUpdateAt"]),
//         createdAt = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ").parse(json["createdAt"]);
//
//   @override
//   String toString() {
//     return 'InterestWebtoonDTO{id: $id, userId: $userId, webtoonId: $webtoonId, isAlarm: $isAlarm, webtoonImage: $webtoonImage, webtoonEpisodeUpdateAt: $webtoonEpisodeUpdateAt, createdAt: $createdAt}';
//   }
// }
