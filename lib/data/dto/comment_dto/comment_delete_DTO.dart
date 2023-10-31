import 'package:flutter_blog/data/dto/comment_dto/re_comment_DTO.dart';
import 'package:intl/intl.dart';

class CommentDeleteDTO {
  final int id;
  final int userId;
  final int deletedId;
  final bool isDelete;

  CommentDeleteDTO(this.id, this.userId, this.deletedId, this.isDelete);

  // Map 형태로 받아서 Dart 객체로 변환합니다.
  CommentDeleteDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        userId = json["userId"],
        deletedId = json["deletedId"],
        isDelete = json["isDelete"];

  @override
  String toString() {
    return 'CommentDeleteDTO{id: $id, userId: $userId, deletedId: $deletedId, isDelete: $isDelete}';
  }
}
