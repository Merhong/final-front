import 'package:intl/intl.dart';

class WebtoonHashTag {
  int id;
  String hashTagEnum;
  String hashTagName;

  WebtoonHashTag(this.id, this.hashTagEnum, this.hashTagName);

  WebtoonHashTag.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        hashTagEnum = json["hashTagEnum"],
        hashTagName = json["hashTagName"];

  @override
  String toString() {
    return 'WebtoonHashTag{id: $id, hashTagEnum: $hashTagEnum, hashTagName: $hashTagName}';
  }
}
