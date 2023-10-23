import 'package:intl/intl.dart';

class Episode {
  int episodeId;
  String detailTitle;
  String thumbnail;
  double starCount;
  int? cookieCost;
  DateTime createdAt;

  // 생성자는 선택적 매개변수에 required 하는게 편하다
  Episode({
    required this.episodeId,
    required this.detailTitle,
    required this.thumbnail,
    required this.starCount,
    this.cookieCost,
    required this.createdAt,
  });

  // 2. Map 형태로 받아서 Dart 객체로 변환합니다.
  // 이니셜라이저: 안쓰고 {} 안에 적으면 타이밍상 필드 초기화가 안됨
  // 이름이 있는 생성자
  Episode.fromJson(Map<String, dynamic> json)
      : episodeId = json["episodeId"],
        detailTitle = json["detailTitle"],
        thumbnail = json["thumbnail"],
        starCount = json["starCount"],
        cookieCost = json["cookieCost"],
        createdAt = DateFormat("yyyy-mm-dd").parse(json["createdAt"]);

  @override
  String toString() {
    return 'Episode{episodeId: $episodeId, detailTitle: $detailTitle, thumbnail: $thumbnail, starCount: $starCount, cookieCost: $cookieCost, createdAt: $createdAt}';
  }
}
