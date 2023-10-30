import 'package:flutter_blog/data/model/author.dart';
import 'package:flutter_blog/data/model/episode.dart';
import 'package:intl/intl.dart';

class ReCommentLikeDTO {
  int id;
  int userId;
  int reCommentId;
  int commentId;
  bool isLike;
  DateTime createdAt;

  ReCommentLikeDTO(this.id, this.userId, this.reCommentId, this.commentId, this.isLike, this.createdAt);

  // Map 형태로 받아서 Dart 객체로 변환합니다.
  ReCommentLikeDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        userId = json["userId"],
        reCommentId = json["reCommentId"],
        commentId = json["commentId"],
        isLike = json["isLike"],
        createdAt = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ").parse(json["createdAt"]);

  @override
  String toString() {
    return 'ReCommentLikeDTO{id: $id, userId: $userId, reCommentId: $reCommentId, commentId: $commentId, isLike: $isLike, createdAt: $createdAt}';
  }
}
