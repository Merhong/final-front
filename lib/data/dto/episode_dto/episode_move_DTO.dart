import 'package:flutter_blog/data/model/episode_photo.dart';
import 'package:intl/intl.dart';

class EpisodeMoveDTO {
  final int id;
  final String detailTitle;
  final String thumbnail;

  EpisodeMoveDTO(this.id, this.detailTitle, this.thumbnail); // Map 형태로 받아서 Dart 객체로 변환합니다.

  EpisodeMoveDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        detailTitle = json["detailTitle"],
        thumbnail = json["thumbnail"];

  @override
  String toString() {
    return 'EpisodeMoveDTO{id: $id, detailTitle: $detailTitle, thumbnail: $thumbnail}';
  }
}
