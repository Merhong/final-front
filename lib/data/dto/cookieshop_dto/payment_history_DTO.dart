class PaymentHistoryDTOList {
  List<PaymentHistoryDTO> dto;

  PaymentHistoryDTOList(this.dto);

  PaymentHistoryDTOList.fromJson(Map<String, dynamic> json)
      : dto = (json["dtoList"] as List)
            .map((e) => PaymentHistoryDTO.fromJson(e))
            .toList();
}

class PaymentHistoryDTO {
  int purchasedCookie;
  int nowCookieAmount;
  int price;
  DateTime createdAt;

  PaymentHistoryDTO(
      this.purchasedCookie, this.nowCookieAmount, this.price, this.createdAt);

  // Map 형태로 받아서 Dart 객체로 변환합니다.
  PaymentHistoryDTO.fromJson(Map<String, dynamic> json)
      : purchasedCookie = json["purchasedCookie"],
        nowCookieAmount = json["nowCookieAmount"],
        price = json["price"],
        createdAt = DateTime.parse(json["createdAt"]);

  @override
  String toString() {
    return 'PaymentHistoryDTO{purchasedCookie: $purchasedCookie, nowCookieAmount: $nowCookieAmount, price: $price, createdAt: $createdAt}';
  }
}
