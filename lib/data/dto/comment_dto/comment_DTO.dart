import 'package:flutter_blog/data/dto/comment_dto/re_comment_DTO.dart';
import 'package:flutter_blog/data/model/Author.dart';
import 'package:flutter_blog/data/model/episode.dart';
import 'package:intl/intl.dart';

class CommentDTO {
  final int id;
  final int episodeId;
  final int likeCommentCount;
  final int dislikeCommentCount;
  final bool isDelete;
  final String text;
  final bool isAuthor;
  final DateTime createdAt;
  final int userId;
  final String userEmail;
  final String userUsername;
  final List<ReCommentDTO> reCommentList;

  CommentDTO(this.id, this.episodeId, this.likeCommentCount, this.dislikeCommentCount, this.isDelete, this.text, this.isAuthor, this.createdAt,
      this.userId, this.userEmail, this.userUsername, this.reCommentList);

  // Map 형태로 받아서 Dart 객체로 변환합니다.
  CommentDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        episodeId = json["episodeId"],
        likeCommentCount = json["likeCommentCount"],
        dislikeCommentCount = json["dislikeCommentCount"],
        isDelete = json["isDelete"],
        text = json["text"],
        isAuthor = json["isAuthor"],
        createdAt = DateFormat("yyyy-mm-dd").parse(json["createdAt"]),
        userId = json["userId"],
        userEmail = json["userEmail"],
        userUsername = json["userUsername"],
        reCommentList = (json["reCommentList"] as List).map((jsonReComment) => ReCommentDTO.fromJson(jsonReComment)).toList();

  @override
  String toString() {
    return 'CommentDTO{id: $id, episodeId: $episodeId, likeCommentCount: $likeCommentCount, dislikeCommentCount: $dislikeCommentCount, isDelete: $isDelete, text: $text, isAuthor: $isAuthor, createdAt: $createdAt, userId: $userId, userEmail: $userEmail, userUsername: $userUsername, reCommentList: $reCommentList}';
  }
}
