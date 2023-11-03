class RatingStarReqDTO {
  final int score;

  RatingStarReqDTO({required this.score});

  Map<String, dynamic> toJson() => {"score": score};
  //서버로 요청 dto를 보낼때 제이슨으로 바꿔줌
}
