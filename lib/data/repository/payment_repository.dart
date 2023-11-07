import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
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
}
