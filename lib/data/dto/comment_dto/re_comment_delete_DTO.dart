import 'package:flutter_blog/data/dto/comment_dto/re_comment_DTO.dart';
import 'package:intl/intl.dart';

class ReCommentDeleteDTO {
  final int id;
  final int userId;
  final int commentId;
  final int deletedId;
  final bool isDelete;

  ReCommentDeleteDTO(this.id, this.userId, this.commentId, this.deletedId, this.isDelete);

  // Map 형태로 받아서 Dart 객체로 변환합니다.
  ReCommentDeleteDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        userId = json["userId"],
        commentId = json["commentId"],
        deletedId = json["deletedId"],
        isDelete = json["isDelete"];

  @override
  String toString() {
    return 'ReCommentDeleteDTO{id: $id, userId: $userId, commentId: $commentId, deletedId: $deletedId, isDelete: $isDelete}';
  }
}
