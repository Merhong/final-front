class PaymenResDTO {
  final int? nowCookieAmount;

  PaymenResDTO(this.nowCookieAmount);

  PaymenResDTO.fromJson(Map<String, dynamic> json)
      : nowCookieAmount = json["nowCookieAmount"];
}
