import 'package:flutter_blog/data/dto/user_dto/interest_author_detail_board_DTO.dart';
import 'package:flutter_blog/data/dto/user_dto/interest_author_detail_webtoon_DTO.dart';

class InterestAuthorDetailDTO {
  int id;
  int userId;
  String? authorNickname;
  String? authorPhoto;
  String? siteURL;
  String? introduce;
  int? interestCount;
  bool? isInterest;

  List<InterestAuthorDetailWebtoonDTO>? authorWebtoonList;
  List<InterestAuthorDetailBoardDTO>? authorBoardList;

  InterestAuthorDetailDTO(this.id, this.userId, this.authorNickname, this.authorPhoto, this.siteURL, this.introduce, this.interestCount,
      this.isInterest, this.authorWebtoonList, this.authorBoardList);

  // Map 형태로 받아서 Dart 객체로 변환합니다.
  InterestAuthorDetailDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        userId = json["userId"],
        authorNickname = json["authorNickname"],
        authorPhoto = json["authorPhoto"],
        siteURL = json["siteURL"],
        introduce = json["introduce"],
        interestCount = json["interestCount"],
        isInterest = json["isInterest"],
        authorWebtoonList = (json["authorWebtoonList"] as List).map((jsonDW) => InterestAuthorDetailWebtoonDTO.fromJson(jsonDW)).toList(),
        authorBoardList = (json["authorBoardList"] as List).map((jsonDA) => InterestAuthorDetailBoardDTO.fromJson(jsonDA)).toList();

  @override
  String toString() {
    return 'InterestAuthorDetailDTO{id: $id, userId: $userId, authorNickname: $authorNickname, authorPhoto: $authorPhoto, siteURL: $siteURL, introduce: $introduce, interestCount: $interestCount, isInterest: $isInterest, authorWebtoonList: $authorWebtoonList, authorBoardList: $authorBoardList}';
  }
}
