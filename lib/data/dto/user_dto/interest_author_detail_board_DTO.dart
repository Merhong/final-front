import 'package:intl/intl.dart';

class InterestAuthorDetailBoardDTO {
  int id;
  int authorId;
  String? title;
  String? text;

  String? photo;
  DateTime? createdAt;

  InterestAuthorDetailBoardDTO(
    this.id,
    this.authorId,
    this.title,
    this.text,
    this.photo,
    this.createdAt,
  );

  // Map 형태로 받아서 Dart 객체로 변환합니다.
  InterestAuthorDetailBoardDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        authorId = json["authorId"],
        title = json["title"],
        text = json["text"],
        photo = json["photo"],
        createdAt = json["createdAt"] == null ? null : DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ").parse(json["createdAt"]);

  @override
  String toString() {
    return 'InterestAuthorDTO{id: $id, authorId: $authorId, title: $title, text: $text, photo: $photo, createdAt: $createdAt}';
  }
}
