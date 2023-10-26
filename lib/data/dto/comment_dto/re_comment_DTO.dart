import 'package:intl/intl.dart';

class ReCommentDTO {
  final int id;
  final int commentId;
  final bool isDelete;
  final String text;
  final DateTime createdAt;
  final int likeReCommentCount;
  final int dislikeReCommentCount;
  final int userId;
  final String userEmail;
  final String userUsername;

  ReCommentDTO(this.id, this.commentId, this.isDelete, this.text, this.createdAt, this.likeReCommentCount, this.dislikeReCommentCount, this.userId,
      this.userEmail, this.userUsername);
  // Map 형태로 받아서 Dart 객체로 변환합니다.
  ReCommentDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        commentId = json["commentId"],
        isDelete = json["isDelete"],
        text = json["text"],
        createdAt = DateFormat("yyyy-mm-dd").parse(json["createdAt"]),
        likeReCommentCount = json["likeReCommentCount"],
        dislikeReCommentCount = json["dislikeReCommentCount"],
        userId = json["userId"],
        userEmail = json["userEmail"],
        userUsername = json["userUsername"];
// reCommentList = (json["reCommentList"] as List).map((jsonReComment) => ReComment.fromJson(jsonReComment)).toList();

  @override
  String toString() {
    return 'CommentDTO{id: $id, commentId: $commentId, isDelete: $isDelete, text: $text, createdAt: $createdAt, likeReCommentCount: $likeReCommentCount, dislikeReCommentCount: $dislikeReCommentCount, userId: $userId, userEmail: $userEmail, userUsername: $userUsername}';
  }
}
