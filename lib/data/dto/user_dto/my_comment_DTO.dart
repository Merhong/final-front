import 'package:flutter_blog/data/dto/comment_dto/re_comment_DTO.dart';
import 'package:intl/intl.dart';

class MyCommentDTO {
  final int id;
  final String text;
  final DateTime createdAt;
  final int userId;
  final int episodeId;
  final String episodeTitle;
  final String episodeThumbnail;
  final int webtoonId;
  final String webtoonTitle;
  int likeCommentCount;
  int dislikeCommentCount;
  int reCommentCount;

  MyCommentDTO(this.id, this.text, this.createdAt, this.userId, this.episodeId, this.episodeTitle, this.episodeThumbnail, this.webtoonId,
      this.webtoonTitle, this.likeCommentCount, this.dislikeCommentCount, this.reCommentCount);

  // Map 형태로 받아서 Dart 객체로 변환합니다.
  MyCommentDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        text = json["text"],
        createdAt = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ").parse(json["createdAt"]),
        userId = json["userId"],
        episodeId = json["episodeId"],
        episodeTitle = json["episodeTitle"],
        episodeThumbnail = json["episodeThumbnail"],
        webtoonId = json["webtoonId"],
        webtoonTitle = json["webtoonTitle"],
        likeCommentCount = json["likeCommentCount"],
        dislikeCommentCount = json["dislikeCommentCount"],
        reCommentCount = json["reCommentCount"];

  @override
  String toString() {
    return 'MyCommentDTO{id: $id, text: $text, createdAt: $createdAt, userId: $userId, episodeId: $episodeId, episodeTitle: $episodeTitle, episodeThumbnail: $episodeThumbnail, webtoonId: $webtoonId, webtoonTitle: $webtoonTitle, likeCommentCount: $likeCommentCount, dislikeCommentCount: $dislikeCommentCount, reCommentCount: $reCommentCount}';
  }
}
