import 'package:intl/intl.dart';

//데이터 모델 정의 , JSON 데이터를 해당 모델로 변환
class RatingStarDTO {
  final int id;
  final int userId;
  int episodeId;
  bool isStar;
  bool isLike;
  DateTime createdAt;
  int episodeStarCount;
  int episodeStarScore;

  RatingStarDTO(this.id, this.userId, this.episodeId, this.isStar, this.isLike,
      this.createdAt, this.episodeStarCount, this.episodeStarScore);

  // Map 형태로 받아서 Dart 객체로 변환합니다.
  RatingStarDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        userId = json["userId"],
        episodeId = json["episodeId"],
        isStar = json["isStar"],
        isLike = json["isLike"],
        createdAt =
            DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ").parse(json["createdAt"]),
        episodeStarCount = json["episodeStarCount"],
        episodeStarScore = json["episodeStarScore"];
  // authorNicknameList = json["authorNicknameList"];
  //       authorNicknameList = (json["authorNicknameList"] as List).map((jsonAuthorNickname) => jsonAuthorNickname.toString()).toList(),
  //       episodeUpdatedAt = json["episodeUpdatedAt"] == null ? null : DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ").parse(json["episodeUpdatedAt"]);

  @override
  String toJson() {
    //현재 객체를 Json 문자열로 변환
    return 'RatingStarDTO{id: $id, userId: $userId, episodeId: $episodeId, isStar: $isStar, isLike: $isLike, createdAt: $createdAt, episodeStarCount: $episodeStarCount, episodeStarScore: $episodeStarScore}';
  }
}
