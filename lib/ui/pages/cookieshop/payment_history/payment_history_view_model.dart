import 'package:flutter_blog/data/dto/cookieshop_dto/payment_history_DTO.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/provider/session_provider.dart';
import 'package:flutter_blog/data/repository/payment_repository.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class PaymentHistoryModel {
  List<PaymentHistoryDTO> paymentHistoryDTOList;

  PaymentHistoryModel({required this.paymentHistoryDTOList});
}

class PaymentHistoryViewModel extends StateNotifier<PaymentHistoryModel?> {
  Ref ref;
  final mContext = navigatorKey.currentContext;

  PaymentHistoryViewModel(this.ref, super._state);

  Future<void> notifyInit() async {
    Logger().d("뷰모델 실행");
    SessionUser sessionUser = ref.read(sessionProvider);
    ResponseDTO responseDTO =
        await paymentRepository().fetchPaymentHistory(sessionUser.jwt!);
    Logger().d("여기");

    state = PaymentHistoryModel(paymentHistoryDTOList: responseDTO.data);
  }
}

final paymentHistoryProvider = StateNotifierProvider.autoDispose<
    PaymentHistoryViewModel, PaymentHistoryModel?>((ref) {
  return new PaymentHistoryViewModel(ref, null)..notifyInit();
});
