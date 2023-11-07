import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/dto/purchase_request.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/provider/param_provider.dart';
import 'package:flutter_blog/data/provider/session_provider.dart';
import 'package:flutter_blog/data/repository/payment_repository.dart';
import 'package:flutter_blog/ui/pages/pay/home_page/wigets/pay_home_bottom.dart';
import 'package:flutter_blog/ui/pages/pay/home_page/wigets/pay_home_bottom_detail.dart';
import 'package:flutter_blog/ui/pages/pay/home_page/wigets/pay_home_middle.dart';
import 'package:flutter_blog/ui/pages/pay/home_page/wigets/pay_home_top.dart';
import 'package:flutter_blog/ui/pages/pay/pay_method_page/pay_method_page.dart';

// class PayHomePage extends StatelessWidget {
//   const PayHomePage({Key? key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text('PAY', style: TextStyle(color: Colors.black)),
//             Text('결제하기', style: TextStyle(color: Colors.black)),
//             IconButton(
//               icon: Icon(Icons.close),
//               color: Colors.black,
//               onPressed: () {
//                 // 앱 종료 코드
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         ),
//       ),
//       body: Padding(
//         padding: EdgeInsets.fromLTRB(
//             sizePaddingLR17, sizeM10, sizePaddingLR17, sizeM10),
//         child: CustomScrollView(
//           slivers: [
//             SliverPadding(
//               padding: EdgeInsets.only(top: 8),
//               sliver: SliverList(
//                 delegate: SliverChildBuilderDelegate(
//                   (BuildContext context, int index) {
//                     return Container(
//                       child: PayHomeTop(),
//                     );
//                   },
//                   childCount: 1,
//                 ),
//               ),
//             ),
//             SliverPadding(
//               padding: EdgeInsets.only(top: 8),
//               sliver: SliverList(
//                 delegate: SliverChildBuilderDelegate(
//                   (BuildContext context, int index) {
//                     return Container(
//                       child: PayHomeMiddle(),
//                     );
//                   },
//                   childCount: 1,
//                 ),
//               ),
//             ),
//             SliverPadding(
//               padding: EdgeInsets.only(top: 8),
//               sliver: SliverList(
//                 delegate: SliverChildBuilderDelegate(
//                   (BuildContext context, int index) {
//                     return Container(
//                       child: PayHomeBottom(),
//                     );
//                   },
//                   childCount: 1,
//                 ),
//               ),
//             ),
//             SliverPadding(
//               padding: EdgeInsets.only(top: 8),
//               sliver: SliverList(
//                 delegate: SliverChildBuilderDelegate(
//                   (BuildContext context, int index) {
//                     return Container(
//                       child: PayHomeBottomDetail(),
//                     );
//                   },
//                   childCount: 1,
//                 ),
//               ),
//             ),
//             SliverPadding(
//               padding: EdgeInsets.only(top: 8),
//               sliver: SliverList(
//                 delegate: SliverChildBuilderDelegate(
//                   (BuildContext context, int index) {
//                     return Column(
//                       children: [
//                         Text(
//                           '주문 내용을 확인 하였으며, 정보 제공 등에 동의합니다.',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold, // 굵은 글꼴 설정
//                           ),
//                         ),
//                         SizedBox(height: 16), // 원하는 간격 설정
//                         ElevatedButton(
//                           onPressed: () {
//                             // 버튼 클릭 시 수행할 동작
//                             Navigator.of(context).push(
//                               MaterialPageRoute(
//                                 builder: (context) =>
//                                     PayMethodPage(), // PayMethodPage로 이동
//                               ),
//                             );
//                           },
//                           style: ButtonStyle(
//                             backgroundColor:
//                                 MaterialStateProperty.all(Colors.green), // 배경색
//                             foregroundColor:
//                                 MaterialStateProperty.all(Colors.white), // 글자색
//                             minimumSize: MaterialStateProperty.all(
//                                 Size(double.infinity, 60.0)), // 최소 너비와 높이 설정
//                             padding: MaterialStateProperty.all(
//                                 EdgeInsets.all(12.0)), // 내부 패딩
//                             textStyle: MaterialStateProperty.all(TextStyle(
//                               fontSize: 18.0, // 글자 크기
//                               fontWeight: FontWeight.bold, // 글자 굵기
//                             )),
//                           ),
//                           child: Text('결제하기'), // 버튼 텍스트 설정
//                         )
//                       ],
//                     );
//                   },
//                   childCount: 1,
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/webtoon/detail_page/webtoon_detail_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/* 아임포트 결제 모듈을 불러옵니다. */
import 'package:iamport_flutter/iamport_payment.dart';
/* 아임포트 결제 데이터 모델을 불러옵니다. */
import 'package:iamport_flutter/model/payment_data.dart';

class PayHomePage extends ConsumerWidget {
  final String cookieCount;
  final String price;
  const PayHomePage({Key? key, required this.cookieCount, required this.price});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int amount = int.parse(price);
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
        name: '쿠키 ${cookieCount}', // 주문명
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
          PurchaseReqDTO purchaseReqDTO = new PurchaseReqDTO(
              cookieAmount: amount, userId: session.user!.id);
          ResponseDTO responseDTO = await paymentRepository()
              .fetchPayment(purchaseReqDTO, session.jwt!);
          if (responseDTO.success == true) {
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
