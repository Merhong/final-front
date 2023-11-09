import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/cookieshop_dto/payment_history_DTO.dart';
import 'package:flutter_blog/data/dto/purchase_request.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';

class paymentRepository {
  Future<ResponseDTO> fetchPayment(PurchaseReqDTO dto, String jwt) async {
    try {
      Response response = await dio.post("/payment/result",
          data: dto.toJson(),
          options: Options(headers: {"Authorization": "${jwt}"}));
      ResponseDTO responseDTO = new ResponseDTO.fromJson(response.data);
      return responseDTO;
    } catch (e) {
      return new ResponseDTO(success: false, data: "통신 실패");
    }
  }

  Future<ResponseDTO> fetchPaymentHistory(String jwt) async {
    try {
      Response response = await dio.get("/payment/history",
          options: Options(headers: {"Authorization": "${jwt}"}));

      ResponseDTO responseDTO = new ResponseDTO.fromJson(response.data);

      List<dynamic> mapList = responseDTO.data as List<dynamic>;

      List<PaymentHistoryDTO> paymentHistoryDTO = mapList
          .map((paymentHistoryDTO) =>
              PaymentHistoryDTO.fromJson(paymentHistoryDTO))
          .toList();

      responseDTO.data = paymentHistoryDTO;

      return responseDTO;
    } catch (e) {
      return new ResponseDTO(success: false, data: "레파지토리에서 오류");
    }
  }
}
