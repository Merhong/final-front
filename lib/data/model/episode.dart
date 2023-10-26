import 'package:intl/intl.dart';

class Episode {
  int episodeId; //
  String detailTitle;
  String? thumbnail;
  String? authorText;
  int? cookieCost;
  double starScore;
  double starCount;
  DateTime createdAt;

  // DateTime? updatedAt;

  // 생성자는 선택적 매개변수에 required 하는게 편하다
  Episode({
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
  Episode.fromJson(Map<String, dynamic> json)
      : episodeId = json["episodeId"],
        detailTitle = json["detailTitle"],
        thumbnail = json["thumbnail"],
        authorText = json["authorText"],
        cookieCost = json["cookieCost"],
        starScore = json["starScore"],
        starCount = json["starCount"],
        createdAt = DateFormat("yyyy-mm-dd").parse(json["createdAt"]);

  // updatedAt = DateFormat("yyyy-mm-dd").parse(json["updatedAt"]);

  @override
  String toString() {
    return 'Episode{episodeId: $episodeId, detailTitle: $detailTitle, thumbnail: $thumbnail, cookieCost: $cookieCost, starScore: $starScore, starCount: $starCount, createdAt: $createdAt}';
  }
}
