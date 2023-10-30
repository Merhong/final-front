import 'package:flutter_blog/data/model/episode_photo.dart';
import 'package:intl/intl.dart';

class EpisodeDTO {
  final int episodeId;
  final String detailTitle;
  final double starScore;
  final double starCount;
  final DateTime createdAt;
  final String authorText;
  final String authorName;
  final int webtoonId;
  final String webtoonName;
  final int cookieCost;
  final int likeEpisodeCount;
  final int commentCount;
  // List<Comment> commentList;
  final List<EpisodePhoto> photoList;

  // 에피소드말고 상위웹툰의 전체 에피소드 개수 필요

  EpisodeDTO(
    this.episodeId,
    this.detailTitle,
    this.starScore,
    this.starCount,
    this.createdAt,
    this.authorText,
    this.authorName,
    this.webtoonId,
    this.webtoonName,
    this.cookieCost,
    this.commentCount,
    this.likeEpisodeCount,
    this.photoList,
  );

  // Map 형태로 받아서 Dart 객체로 변환합니다.
  EpisodeDTO.fromJson(Map<String, dynamic> json)
      : episodeId = json["episodeId"],
        detailTitle = json["detailTitle"],
        starScore = json["starScore"],
        starCount = json["starCount"],
        createdAt = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ").parse(json["createdAt"]),
        authorText = json["authorText"],
        authorName = json["authorName"],
        webtoonId = json["webtoonId"],
        webtoonName = json["webtoonName"],
        cookieCost = json["cookieCost"],
        commentCount = json["commentCount"],
        likeEpisodeCount = json["likeEpisodeCount"],
        photoList = (json["photoList"] as List).map((jsonPhoto) => EpisodePhoto.fromJson(jsonPhoto)).toList();

  @override
  String toString() {
    return 'EpisodeDTO{episodeId: $episodeId, detailTitle: $detailTitle, starScore: $starScore, starCount: $starCount, createdAt: $createdAt, authorText: $authorText, authorName: $authorName, webtoonId: $webtoonId, webtoonName: $webtoonName, cookieCost: $cookieCost, likeEpisodeCount: $likeEpisodeCount, commentCount: $commentCount, photoList: $photoList}';
  }
}
