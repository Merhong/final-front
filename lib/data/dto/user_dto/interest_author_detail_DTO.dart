import 'package:flutter_blog/data/dto/user_dto/interest_author_detail_board_DTO.dart';

class InterestAuthorDetailDTO {
  int id;
  int authorId;
  String? authorNickname;
  String? authorPhoto;
  int interestCount;
  String? authorSiteURL;
  String? introduce;
  int webtoonId;
  String? webtoonTitle;
  String? webtoonImage;
  DateTime? webtoonUpdateAt;
  bool isInterest;
  List<InterestAuthorDetailBoardDTO>? interestAuthorDetailBoardList;

  InterestAuthorDetailDTO(
      this.id,
      this.authorId,
      this.authorNickname,
      this.authorPhoto,
      this.interestCount,
      this.authorSiteURL,
      this.introduce,
      this.webtoonId,
      this.webtoonTitle,
      this.webtoonImage,
      this.isInterest,
      this.interestAuthorDetailBoardList);

  // Map 형태로 받아서 Dart 객체로 변환합니다.
  InterestAuthorDetailDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        authorId = json["authorId"],
        authorNickname = json["authorNickname"],
        authorPhoto = json["authorPhoto"],
        interestCount = json["interestCount"],
        authorSiteURL = json["authorSiteURL"],
        introduce = json["introduce"],
        webtoonId = json["webtoonId"],
        webtoonTitle = json["webtoonTitle"],
        webtoonImage = json["webtoonImage"],
        isInterest = json["isInterest"],
        interestAuthorDetailBoardList = json["interestAuthorDetailBoardList"];

  @override
  String toString() {
    return "InterestAuthorDTO{id: $id, authorId: $authorId, authorNickname: $authorNickname, authorPhoto: $authorPhoto, "
        "interestCount: $interestCount, authorSiteURL: $authorSiteURL, interestCount: $interestCount, introduce: $introduce,  "
        "interestAuthorDetailBoardList: $interestAuthorDetailBoardList}";
  }
}
