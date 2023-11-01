import 'package:intl/intl.dart';

class AdvertisingMainDTO {
  int id;
  String? mainText;
  String? subText;
  String? photo;
  String? linkURL;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? endDate;
  int webtoonId;
  String? webtoonTitle;
  String? webtoonSpeciallyEnum;
  List<String>? authorNicknameList;

  AdvertisingMainDTO(this.id, this.mainText, this.subText, this.photo, this.linkURL, this.createdAt, this.updatedAt, this.endDate, this.webtoonId,
      this.webtoonTitle, this.webtoonSpeciallyEnum, this.authorNicknameList);

  // Map 형태로 받아서 Dart 객체로 변환합니다.
  AdvertisingMainDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        mainText = json["mainText"],
        subText = json["subText"],
        photo = json["photo"],
        linkURL = json["linkURL"],
        webtoonId = json["webtoonId"],
        webtoonTitle = json["webtoonTitle"],
        webtoonSpeciallyEnum = json["webtoonSpeciallyEnum"] == null ? "없음" : json["webtoonSpeciallyEnum"],
        authorNicknameList = (json["authorNicknameList"] as List).map((jsonAuthorNickname) => jsonAuthorNickname.toString()).toList(),
        createdAt = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ").parse(json["createdAt"]),
        updatedAt = json["updatedAt"] == null ? null : DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ").parse(json["updatedAt"]),
        endDate = json["endDate"] == null ? null : DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ").parse(json["endDate"]);

  @override
  String toString() {
    return 'AdvertisingMainDTO{id: $id, mainText: $mainText, subText: $subText, photo: $photo, linkURL: $linkURL, createdAt: $createdAt, updatedAt: $updatedAt, endDate: $endDate, webtoonId: $webtoonId, webtoonTitle: $webtoonTitle, webtoonSpeciallyEnum: $webtoonSpeciallyEnum, authorNicknameList: $authorNicknameList}';
  }
}
