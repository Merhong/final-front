import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/cookieshop_dto/payment_history_DTO.dart';
import 'package:flutter_blog/data/dto/cookieshop_dto/payment_res_DTO.dart';
import 'package:flutter_blog/data/dto/purchase_request.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:logger/logger.dart';

class paymentRepository {
  Future<ResponseDTO> fetchPayment(PurchaseReqDTO dto, String jwt) async {
    try {
      Response response = await dio.post("/payment/result",
          data: dto.toJson(),
          options: Options(headers: {"Authorization": "${jwt}"}));
      Logger().d("통신 완료", response);
      ResponseDTO responseDTO = new ResponseDTO.fromJson(response.data);
      Logger().d("1차 파싱 완료", responseDTO.data);
      PaymenResDTO resDTO = new PaymenResDTO.fromJson(responseDTO.data);
      Logger().d("2차 파싱 완료", resDTO.nowCookieAmount);

      responseDTO.data = resDTO;

      return responseDTO;
    } catch (e) {
      return new ResponseDTO(success: false, data: "통신 실패");
    }
  }

  Future<ResponseDTO> fetchPaymentHistory(String jwt) async {
    try {
      Response response = await dio.get("/payment/history",
          options: Options(headers: {"Authorization": "$jwt"}));
      Logger().d("통신 완료");
      ResponseDTO responseDTO = new ResponseDTO.fromJson(response.data);
      Logger().d("1차 파싱 완료");

      List<dynamic> mapList = responseDTO.data["dtoList"];
      Logger().d(mapList);

      List<PaymentHistoryDTO> dtoList =
          mapList.map((e) => PaymentHistoryDTO.fromJson(e)).toList();

      Logger().d("2차 파싱 완료");

      responseDTO.data = dtoList;

      return responseDTO;
    } catch (e) {
      return new ResponseDTO(success: false, data: "레파지토리에서 오류");
    }
  }
}
