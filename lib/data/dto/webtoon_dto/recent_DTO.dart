import 'package:flutter_blog/data/model/author.dart';
import 'package:intl/intl.dart';

class RecentDTO {
  int id;
  int recentEpisodeId;
  String recentEpisodeTitle;
  String recentEpisodeThumbnail;
  int webtoonId;
  String webtoonTitle;
  String webtoonSpeciallyEnum;
  int totalCount;
  int viewCount;
  DateTime? updatedAt;

  RecentDTO(
      {required this.id,
      required this.recentEpisodeId,
      required this.recentEpisodeTitle,
      required this.recentEpisodeThumbnail,
      required this.webtoonId,
      required this.webtoonTitle,
      required this.webtoonSpeciallyEnum,
      required this.totalCount,
      required this.viewCount,
      this.updatedAt});

  // Map 형태로 받아서 Dart 객체로 변환합니다.
  RecentDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        recentEpisodeId = json["recentEpisodeId"],
        recentEpisodeTitle = json["recentEpisodeTitle"],
        recentEpisodeThumbnail = json["recentEpisodeThumbnail"],
        webtoonId = json["webtoonId"],
        webtoonTitle = json["webtoonTitle"],
        webtoonSpeciallyEnum = json["webtoonSpeciallyEnum"],
        totalCount = json["totalCount"],
        viewCount = json["viewCount"],
        updatedAt = json["updatedAt"] == null ? null : DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ").parse(json["updatedAt"]);

  @override
  String toString() {
    return 'RecentDTO{id: $id, recentEpisodeId: $recentEpisodeId, recentEpisodeTitle: $recentEpisodeTitle, recentEpisodeThumbnail: $recentEpisodeThumbnail, webtoonId: $webtoonId, webtoonTitle: $webtoonTitle, webtoonSpeciallyEnum: $webtoonSpeciallyEnum, totalCount: $totalCount, viewCount: $viewCount, updatedAt: $updatedAt}';
  }
}
