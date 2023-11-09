import 'package:flutter_blog/data/model/author.dart';
import 'package:intl/intl.dart';

class RecommendAuthorDTO {
  int authorId;
  String? authorPhoto;
  String? authorNickname;
  String? authorSiteURL;
  DateTime? authorBoardCreateAt;
  String? webtoonTitle;
  bool isInterest = false;

  RecommendAuthorDTO(this.authorId, this.authorPhoto, this.authorNickname, this.authorSiteURL, this.authorBoardCreateAt, this.webtoonTitle);

  // Map 형태로 받아서 Dart 객체로 변환합니다.
  RecommendAuthorDTO.fromJson(Map<String, dynamic> json)
      : authorId = json["authorId"],
        authorPhoto = json["authorPhoto"],
        authorNickname = json["authorNickname"],
        authorSiteURL = json["authorSiteURL"],
        authorBoardCreateAt = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ").parse(json["authorBoardCreateAt"]),
        webtoonTitle = json["webtoonTitle"];

  @override
  String toString() {
    return 'RecommendAuthorDTO{authorId: $authorId, authorPhoto: $authorPhoto, authorNickname: $authorNickname, authorSiteURL: $authorSiteURL, authorBoardCreateAt: $authorBoardCreateAt, webtoonTitle: $webtoonTitle}';
  }
}
