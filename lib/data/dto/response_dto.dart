class ResponseDTO {
  // int? code; // 서버에서 요청 성공 여부를 응답할 때 사용되는 변수
  // String? msg; // 서버에서 응답 시 보내는 메시지를 담아두는 변수
  String? token; // 헤더로 던진 토큰 값을 담아두는 변수
  dynamic? data; // 서버에서 응답한 데이터를 담아두는 변수
  bool? success;
  ErrorType? errorType;

  ResponseDTO({
    // this.code,
    // this.msg,
    this.data,
    this.success,
    this.errorType,
  });

  ResponseDTO.fromJson(Map<String, dynamic> json)
      : data = json["data"],
        success = json["success"],
        errorType = json["errorType"];

  @override
  String toString() {
    return 'ResponseDTO{token: $token, data: $data, success: $success, errorType: $errorType}';
  }

// response에만 쓰니까 toJson은 필요없다
}

class ErrorType {
  String? message;
  int? status;

  ErrorType(this.message, this.status);
}
