class ReplyReqDTO {
  final String text;

  ReplyReqDTO({required this.text});

  Map<String, dynamic> toJson() => {"text": text};
}
