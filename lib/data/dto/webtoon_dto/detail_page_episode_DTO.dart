import 'package:intl/intl.dart';

class DetailPageEpisodeDTO {
  int episodeId; //
  String detailTitle;
  String? thumbnail;
  String? authorText;
  int? cookieCost;
  double starScore;
  double starCount;
  DateTime createdAt;
  bool? isView;
  // DateTime? updatedAt;

  // 생성자는 선택적 매개변수에 required 하는게 편하다
  DetailPageEpisodeDTO({
    required this.episodeId,
    required this.detailTitle,
    this.thumbnail,
    this.authorText,
    this.cookieCost,
    required this.starScore,
    required this.starCount,
    required this.createdAt,
    // this.updatedAt,
  });

  // 2. Map 형태로 받아서 Dart 객체로 변환합니다.
  // 이니셜라이저: 안쓰고 {} 안에 적으면 타이밍상 필드 초기화가 안됨
  // 이름이 있는 생성자
  DetailPageEpisodeDTO.fromJson(Map<String, dynamic> json)
      : episodeId = json["episodeId"],
        detailTitle = json["detailTitle"],
        thumbnail = json["thumbnail"],
        authorText = json["authorText"],
        cookieCost = json["cookieCost"],
        starScore = json["starScore"],
        starCount = json["starCount"],
        createdAt = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ").parse(json["createdAt"]),
        // isView = json["isView"] == null ? false : json["isView"];
        isView = json["isView"];
  // updatedAt = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ").parse(json["updatedAt"]);

  @override
  String toString() {
    return 'Episode{episodeId: $episodeId, detailTitle: $detailTitle, thumbnail: $thumbnail, cookieCost: $cookieCost, starScore: $starScore, starCount: $starCount, createdAt: $createdAt}';
  }
}
