import 'package:flutter_blog/data/dto/other_dto/advertising_main_DTO.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/dto/webtoon_DTO/list_page_webtoon_DTO.dart';
import 'package:flutter_blog/data/dto/webtoon_dto/search_webtoon_DTO.dart';
import 'package:flutter_blog/data/provider/param_provider.dart';
import 'package:flutter_blog/data/provider/session_provider.dart';
import 'package:flutter_blog/data/repository/webtoon_repository.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 창고 데이터

class SearchModel {
  List<SearchWebtoonDTO> searchDTOList;

  SearchModel({required this.searchDTOList});
}

// 2. 창고
class SearchViewModel extends StateNotifier<SearchModel?> {
  Ref ref;

  final mContext = navigatorKey.currentContext;

  SearchViewModel(this.ref, super._state); // 상태가 바뀌면 자동으로 그려짐

  // notify 구독자들에게 알려줌
  Future<void> notifyInit() async {
    SessionUser sessionUser = ref.read(sessionProvider);
    String searchText = ref.read(paramProvider).searchText!;
    ResponseDTO responseDTO = await WebtoonRepository().fetchSearch(sessionUser.jwt!, searchText);
    List<SearchWebtoonDTO> searchDTOList = responseDTO.data;
    searchDTOList.sort((a, b) => (b.starScore ?? 0).compareTo(a.starScore ?? 0));
    state = SearchModel(searchDTOList: searchDTOList);
  }
}

// 3. 창고 관리자 (View가 빌드되기 직전에 생성됨)
final searchProvider = StateNotifierProvider.autoDispose<SearchViewModel, SearchModel?>((ref) {
  // Logger().d("search창고관리자 실행됨");
  return new SearchViewModel(ref, null)..notifyInit();
});
