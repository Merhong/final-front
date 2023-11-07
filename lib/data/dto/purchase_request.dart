class PurchaseReqDTO {
  final int cookieAmount;
  final int userId;

  PurchaseReqDTO({required this.cookieAmount, required this.userId});

  Map<String, dynamic> toJson() =>
      {"cookieAmount": cookieAmount, "userId": userId};
}
