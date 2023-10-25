

class ListPageWebtoonDTO {
  final int id;
  final String title;
  double? starScore;
  double? starCount;
  String? image;
  int? ageLimit;
  String? specially;
  String? weekDay;
  List<String>? authorNicknameList;

  ListPageWebtoonDTO(this.id, this.title, this.starScore, this.starCount,
      this.image, this.ageLimit, this.specially, this.weekDay);

  // Map 형태로 받아서 Dart 객체로 변환합니다.
  ListPageWebtoonDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        starScore = json["starScore"],
        starCount = json["starCount"],
        image = json["image"],
        ageLimit = json["ageLimit"],
        specially = json["specially"],
        weekDay = json["weekDay"],
        // authorNicknameList = json["authorNicknameList"];
        authorNicknameList = (json["authorNicknameList"] as List)
            .map((jsonAuthorNickname) => jsonAuthorNickname.toString())
            .toList();

  @override
  String toString() {
    return 'ListPageWebtoonDTO{id: $id, title: $title, starScore: $starScore, starCount: $starCount, image: $image, ageLimit: $ageLimit, specially: $specially, weekDay: $weekDay, authorNicknameList: $authorNicknameList}';
  }
}
