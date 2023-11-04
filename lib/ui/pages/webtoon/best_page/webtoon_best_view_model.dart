//1,창고데이터
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/dto/webtoon_dto/best_DTO.dart';
import 'package:flutter_blog/data/provider/session_provider.dart';
import 'package:flutter_blog/data/repository/best_repository.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class WebtoonBestModel {
  List<BestDTO> bestDTOList;

  WebtoonBestModel({required this.bestDTOList});
}

//2,창고
class WebtoonBestViewModel extends StateNotifier<WebtoonBestModel?> {
  Ref ref;

  WebtoonBestViewModel(this.ref, super._state);

  final mContext = navigatorKey.currentContext;

  Future<void> notifyInit() async {
    SessionUser sessionUser = ref.read(sessionProvider);
    ResponseDTO responseDTO =
        await BestRepository().fetchBestList(sessionUser.jwt!);
    Logger().d("notifyInit 실행됨 : ${responseDTO.data}");
    state = WebtoonBestModel(bestDTOList: responseDTO.data);
    // }
  }
}

// 3. 창고 관리자 (View가 빌드되기 직전에 생성됨)
final webtoonBestProvider =
    StateNotifierProvider<WebtoonBestViewModel, WebtoonBestModel?>((ref) {
  // Logger().d("webtoonList창고관리자 실행됨");
  return new WebtoonBestViewModel(ref, null)..notifyInit();
});
