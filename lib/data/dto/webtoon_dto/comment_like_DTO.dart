import 'package:flutter_blog/data/model/author.dart';
import 'package:intl/intl.dart';

class CommentLikeDTO {
  int id;
  int userId;
  int commentId;
  bool isLike;
  DateTime createdAt;

  CommentLikeDTO(this.id, this.userId, this.commentId, this.isLike, this.createdAt);

  // Map 형태로 받아서 Dart 객체로 변환합니다.
  CommentLikeDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        userId = json["userId"],
        commentId = json["commentId"],
        isLike = json["isLike"],
        createdAt = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ").parse(json["createdAt"]);

  @override
  String toString() {
    return 'CommentLikeDTO{id: $id, userId: $userId, commentId: $commentId, isLike: $isLike, createdAt: $createdAt}';
  }
}
