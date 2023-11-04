import 'package:intl/intl.dart';

class AdvertisingSubDTO {
  int id;
  String photo;
  String linkURL;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? endDate;

  AdvertisingSubDTO(this.id, this.photo, this.linkURL, this.createdAt, this.updatedAt, this.endDate);

  // Map 형태로 받아서 Dart 객체로 변환합니다.
  AdvertisingSubDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        photo = json["photo"],
        linkURL = json["linkURL"],
        createdAt = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ").parse(json["createdAt"]),
        updatedAt = json["updatedAt"] == null ? null : DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ").parse(json["updatedAt"]),
        endDate = json["endDate"] == null ? null : DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ").parse(json["endDate"]);

  @override
  String toString() {
    return 'AdvertisingSubDTO{id: $id, photo: $photo, linkURL: $linkURL, createdAt: $createdAt, updatedAt: $updatedAt, endDate: $endDate}';
  }
}
