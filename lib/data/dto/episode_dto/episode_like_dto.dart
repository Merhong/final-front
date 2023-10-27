import 'package:intl/intl.dart';

class EpisodeLikeDTO {
  final int id;
  final int userId;
  final int episodeId;
  final bool isStar;
  final bool isLike;
  final DateTime createdAt;

  EpisodeLikeDTO(this.id, this.userId, this.episodeId, this.isStar, this.isLike,
      this.createdAt);

  EpisodeLikeDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        userId = json["userId"],
        episodeId = json["episodeId"],
        isStar = json["isStar"] ?? false,
        isLike = json["isLike"],
        createdAt = DateFormat("yyyy-mm-dd").parse(json["createdAt"]);

  @override
  String toString() {
    // TODO: implement toString
    return 'EpisodeLikeDTO{id: $id, userId: $userId, episodeId: $episodeId, isStar: $isStar, isLike: $isLike, createdAt: $createdAt}';
  }
}
