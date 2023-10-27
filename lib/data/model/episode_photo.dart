

class EpisodePhoto {
  int id;

  // int episodeId;
  String photoURL;

  // 생성자는 선택적 매개변수에 required 하는게 편하다
  EpisodePhoto({
    required this.id,
    required this.photoURL,
  });

  // 2. Map 형태로 받아서 Dart 객체로 변환합니다.
  // 이니셜라이저: 안쓰고 {} 안에 적으면 타이밍상 필드 초기화가 안됨
  // 이름이 있는 생성자
  EpisodePhoto.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        photoURL = json["photoURL"];

  @override
  String toString() {
    return 'EpisodePhoto{id: $id, photoURL: $photoURL}';
  }
}
