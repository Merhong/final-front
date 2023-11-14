import 'package:flutter_blog/data/dto/cookieshop_dto/payment_history_DTO.dart';
import 'package:flutter_blog/data/dto/purchase_request.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/provider/session_provider.dart';
import 'package:flutter_blog/data/repository/payment_repository.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaymentHistoryModel {
  int? cookieAmount;
  List<PaymentHistoryDTO> paymentHistoryDTOList;

  PaymentHistoryModel(
      {required this.cookieAmount, required this.paymentHistoryDTOList});
}

class PaymentHistoryViewModel extends StateNotifier<PaymentHistoryModel?> {
  Ref ref;
  final mContext = navigatorKey.currentContext;

  PaymentHistoryViewModel(this.ref, super._state);

  Future<ResponseDTO> payment(int numberOfCookie) async {
    SessionUser session = ref.read(sessionProvider);

    PurchaseReqDTO purchaseReqDTO = new PurchaseReqDTO(
        cookieAmount: numberOfCookie, userId: session.user!.id);
    ResponseDTO responseDTO =
        await paymentRepository().fetchPayment(purchaseReqDTO, session.jwt!);

    PaymentHistoryModel model = state!;

    List<PaymentHistoryDTO> currentHistoryDTO = model.paymentHistoryDTOList;
    state = PaymentHistoryModel(
        cookieAmount: responseDTO.data as int?,
        paymentHistoryDTOList: currentHistoryDTO);

    return responseDTO;
  }

  Future<void> notifyInit() async {
    SessionUser sessionUser = ref.read(sessionProvider);
    ResponseDTO responseDTO =
        await paymentRepository().fetchPaymentHistory(sessionUser.jwt!);

    PaymentHistoryModel model = state!;
    int? currentCookie = model.cookieAmount;

    state = PaymentHistoryModel(
        cookieAmount: currentCookie, paymentHistoryDTOList: responseDTO.data);
  }
}

final paymentHistoryProvider = StateNotifierProvider.autoDispose<
    PaymentHistoryViewModel, PaymentHistoryModel?>((ref) {
  return new PaymentHistoryViewModel(ref, null)..notifyInit();
});
