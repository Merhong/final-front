import 'package:flutter_blog/data/model/author.dart';
import 'package:flutter_blog/data/model/episode.dart';
import 'package:intl/intl.dart';

class InterestAuthorDTO {
  int id;
  int userId;
  int authorId;
  String? authorPhoto;
  String? authorNickname;
  String? authorSiteURL;
  List<String> authorWebtoonNameList;
  bool isAlarm;
  DateTime? authorBoardCreateAt;
  DateTime createdAt;

  InterestAuthorDTO(this.id, this.userId, this.authorId, this.authorPhoto, this.authorNickname, this.authorSiteURL, this.authorWebtoonNameList,
      this.isAlarm, this.authorBoardCreateAt, this.createdAt);

  // Map 형태로 받아서 Dart 객체로 변환합니다.
  InterestAuthorDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        userId = json["userId"],
        authorId = json["authorId"],
        authorPhoto = json["authorPhoto"],
        authorNickname = json["authorNickname"],
        authorSiteURL = json["authorSiteURL"],
        authorWebtoonNameList = (json["authorWebtoonNameList"] as List).map((jsonWebtoonName) => jsonWebtoonName.toString()).toList(),
        isAlarm = json["isAlarm"],
        authorBoardCreateAt = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ").parse(json["authorBoardCreateAt"]),
        createdAt = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ").parse(json["createdAt"]);

  @override
  String toString() {
    return 'InterestAuthorDTO{id: $id, userId: $userId, authorId: $authorId, authorPhoto: $authorPhoto, authorNickname: $authorNickname, authorSiteURL: $authorSiteURL, authorWebtoonNameList: $authorWebtoonNameList, isAlarm: $isAlarm, authorBoardCreateAt: $authorBoardCreateAt, createdAt: $createdAt}';
  }
}
