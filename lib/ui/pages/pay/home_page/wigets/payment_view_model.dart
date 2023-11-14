import 'package:flutter_blog/data/dto/purchase_request.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/provider/session_provider.dart';
import 'package:flutter_blog/data/repository/payment_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaymentModel {
  int? cookieAmount;
  PaymentModel({required this.cookieAmount});
}

class PaymentViewModel extends StateNotifier<PaymentModel?> {
  Ref ref;

  PaymentViewModel(super._state, this.ref);

  Future<ResponseDTO> payment(int numberOfCookie) async {
    SessionUser session = ref.read(sessionProvider);

    PurchaseReqDTO purchaseReqDTO = new PurchaseReqDTO(
        cookieAmount: numberOfCookie, userId: session.user!.id);

    ResponseDTO responseDTO =
        await paymentRepository().fetchPayment(purchaseReqDTO, session.jwt!);

    SessionUser user = ref.read(sessionProvider);

    state = PaymentModel(cookieAmount: numberOfCookie);

    user.user!.cookie = state!.cookieAmount;

    return responseDTO;
  }
}

final paymentProvider =
    StateNotifierProvider<PaymentViewModel, PaymentModel?>((ref) {
  return new PaymentViewModel(null, ref);
});
