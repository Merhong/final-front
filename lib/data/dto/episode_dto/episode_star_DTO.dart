import 'package:intl/intl.dart';

class EpisodeStarDTO {
  final int id;
  final int userId;
  final int episodeId;
  final bool isStar;
  final bool isLike;
  final DateTime createdAt;
  double episodeStarCount;
  double episodeStarScore;

  EpisodeStarDTO(this.id, this.userId, this.episodeId, this.isStar, this.isLike, this.createdAt, this.episodeStarCount, this.episodeStarScore);

  EpisodeStarDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        userId = json["userId"],
        episodeId = json["episodeId"],
        isStar = json["isStar"] ?? false,
        isLike = json["isLike"] ?? false,
        createdAt = DateFormat("yyyy-mm-dd").parse(json["createdAt"]),
        episodeStarCount = json["episodeStarCount"],
        episodeStarScore = json["episodeStarScore"];

  @override
  String toString() {
    return 'EpisodeStarDTO{id: $id, userId: $userId, episodeId: $episodeId, isStar: $isStar, isLike: $isLike, createdAt: $createdAt, episodeStarCount: $episodeStarCount, episodeStarScore: $episodeStarScore}';
  }
}
