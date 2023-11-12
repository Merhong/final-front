import 'package:flutter_blog/data/dto/other_dto/advertising_main_DTO.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/dto/webtoon_DTO/list_page_webtoon_DTO.dart';
import 'package:flutter_blog/data/provider/session_provider.dart';
import 'package:flutter_blog/data/repository/webtoon_repository.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 창고 데이터

class PushMoveModel {
  int whereMoveId;

  PushMoveModel({required this.whereMoveId});

  PushMoveModel whereMoveUpdate({required int id}) {
    return PushMoveModel(whereMoveId: id);
  }
}

// 2. 창고
class PushMoveViewModel extends StateNotifier<PushMoveModel?> {
  Ref ref;

  final mContext = navigatorKey.currentContext;

  PushMoveViewModel(this.ref, super._state); // 상태가 바뀌면 자동으로 그려짐

  Future<void> notifyWhereMove(int id) async {
    state = state!.whereMoveUpdate(id: id);
  }

  // notify 구독자들에게 알려줌
  Future<void> notifyInit() async {
    // SessionUser sessionUser = ref.read(sessionProvider);
    // ResponseDTO responseDTO = await WebtoonRepository().fetchWebtoonList(sessionUser.jwt!);
    //
    // List<ListPageWebtoonDTO> webtoonDTOList = responseDTO.data;
    // webtoonDTOList.sort((a, b) => (b.starScore ?? 0).compareTo(a.starScore ?? 0)); // 별점 총합 순 정렬
    //
    // ResponseDTO responseDTO2 = await WebtoonRepository().fetchAdvertisingMainList(sessionUser.jwt!);
    // List<AdvertisingMainDTO> advertisingMainDTOList = responseDTO2.data;

    state = PushMoveModel(whereMoveId: -1);
  }
}

// 3. 창고 관리자 (View가 빌드되기 직전에 생성됨)
final pushMoveProvider = StateNotifierProvider<PushMoveViewModel, PushMoveModel?>((ref) {
  // Logger().d("PushMove창고관리자 실행됨");
  return new PushMoveViewModel(ref, null)..notifyInit();
});
