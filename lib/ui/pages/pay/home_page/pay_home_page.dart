import 'package:flutter/material.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/provider/session_provider.dart';
import 'package:flutter_blog/ui/pages/pay/home_page/wigets/payment_view_model.dart';
import 'package:flutter_blog/ui/pages/webtoon/detail_page/webtoon_detail_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
/* 아임포트 결제 모듈을 불러옵니다. */
import 'package:iamport_flutter/iamport_payment.dart';
import 'package:iamport_flutter/model/payment_data.dart';
import 'package:logger/logger.dart';

class PayHomePage extends ConsumerWidget {
  final String cookieCount;
  final String price;
  const PayHomePage({Key? key, required this.cookieCount, required this.price});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int amount = int.parse(price);
    int numberOfCookie = int.parse(cookieCount);
    SessionUser session = ref.read(sessionProvider);
    WebtoonDetailModel? model = ref.read(webtoonDetailProvider);

    return IamportPayment(
      appBar: new AppBar(
        title: new Text('네이버 웹툰 결제'),
      ),
      /* 웹뷰 로딩 컴포넌트 */
      initialChild: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/pay.png'),
              Padding(padding: EdgeInsets.symmetric(vertical: 15)),
              Text('잠시만 기다려주세요...', style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
      /* [필수입력] 가맹점 식별코드 */
      userCode: 'imp65088447',
      /* [필수입력] 결제 데이터 */
      data: PaymentData(
        pg: 'kakaopay', // PG사
        payMethod: 'card', // 결제수단
        name: cookieCount, // 주문명
        merchantUid: 'mid_${DateTime.now().millisecondsSinceEpoch}', // 주문번호
        amount: amount, // 결제금액
        buyerName: "${session.user!.username}", // 구매자 이름
        buyerTel: '01012345678', // 구매자 연락처
        buyerEmail: "${session.user!.email}", // 구매자 이메일
        appScheme: 'example', // 앱 URL scheme
      ),
      /* [필수입력] 콜백 함수 */
      callback: (Map<String, String> result) async {
        if (result['imp_success'] == 'true') {
          ResponseDTO responseDTO =
              await ref.read(paymentProvider.notifier).payment(numberOfCookie);

          Logger().d(responseDTO.success);
          if (responseDTO.success == true) {
            SessionUser user = ref.read(sessionProvider);
            user.user!.cookie = numberOfCookie;
            Logger().d(user.user!.cookie);
            return AlertDialog(content: Text("결제 완료"));
          } else {
            return AlertDialog(content: Text("결제는 완료, 서버 통신 실패"));
          }
          //서버에 실패했다는 alert창 띄우기
        } else {
          //결제에 실패했다는 alert 창 띄우기
          Navigator.pushReplacementNamed(
            context,
            '/cookieShop',
            arguments: result,
          );
        }
      },
    );
  }
}
