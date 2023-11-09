import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/dto/user_dto/interest_author_DTO.dart';
import 'package:flutter_blog/data/dto/user_dto/interest_author_detail_DTO.dart';
import 'package:flutter_blog/data/dto/user_dto/interest_webtoon_DTO.dart';
import 'package:flutter_blog/data/dto/user_dto/my_interest_author_all_DTO.dart';
import 'package:flutter_blog/data/dto/user_dto/recommend_author_DTO.dart';
import 'package:flutter_blog/data/dto/webtoon_DTO/detail_page_webtoon_DTO.dart';
import 'package:flutter_blog/data/dto/webtoon_dto/interest_DTO.dart';
import 'package:flutter_blog/data/dto/webtoon_dto/interst_webtoon_DTO.dart';
import 'package:flutter_blog/data/provider/param_provider.dart';
import 'package:flutter_blog/data/provider/session_provider.dart';
import 'package:flutter_blog/data/repository/author_detail_repository.dart';
import 'package:flutter_blog/data/repository/author_repository.dart';
import 'package:flutter_blog/data/repository/webtoon_repository.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 창고 데이터

class MyAuthorDetailPageModel {
  // List<InterestAuthorDTO> interestAuthorDTOList;
  InterestAuthorDetailDTO interestAuthorDetailDTO;


  MyAuthorDetailPageModel(this.interestAuthorDetailDTO);

}

// 2. 창고
class MyAuthorPageDetailViewModel extends StateNotifier<MyAuthorDetailPageModel?> {
  Ref ref;
  final mContext = navigatorKey.currentContext;

  // StateNotifier<PostListModel?> 에서 PostListModel은 상태의 타입
  // MyAuthorDetailPageModel(this.ref, super._state); TODO :화면 완성 후 consumer
  // 상태가 바뀌면 자동으로 그려짐

  // notify 구독자들에게 알려줌
  Future<void> notifyInit() async {
    SessionUser sessionUser = ref.read(sessionProvider);
    // int webtoonId = ref.read(paramProvider).webtoonDetailId!;
    ResponseDTO responseDTO = await AuthorDetailRepository().fetchAuthorDetail(sessionUser.jwt!);
    state = MyAuthorDetailPageModel(interestAuthorDetailDTO: responseDTO.data);
    // state = MyAuthorPageModel();
    // state!.webtoonDTO = responseDTO.data;
  }



    MyInterestAuthorAllDTO myInterestAuthorAllDTO = state!.myInterestAuthorAllDTO;
    List<InterestAuthorDTO> interestAuthorDTOList = myInterestAuthorAllDTO.interestAuthorDTOList;

    InterestAuthorDTO updateInterestAuthorDTO = responseDTO.data as InterestAuthorDTO;
    interestAuthorDTOList = interestAuthorDTOList.map((e) => e.id == paramDTO.id ? updateInterestAuthorDTO : e).toList();

    myInterestAuthorAllDTO.interestAuthorDTOList = interestAuthorDTOList;

    state = state!.interestAlarmUpdate(myInterestAuthorAllDTO: myInterestAuthorAllDTO);
  }

  Future<void> notifyMyInterestAdd(RecommendAuthorDTO recommendAuthorDTO) async {
    SessionUser sessionUser = ref.read(sessionProvider);

    ResponseDTO responseDTO = await AuthorRepository().fetchInterestAdd(sessionUser.jwt!, recommendAuthorDTO.authorId);

    if (responseDTO.success == false) {
      print("if로감");
      return;
    }

    print("관심작가등록완료");
  }

  Future<void> notifySort(String sort) async {
    state = state!.sortUpdate(sort: sort);
  }
}

// 3. 창고 관리자 (View가 빌드되기 직전에 생성됨)
final myAuthorPageProvider = StateNotifierProvider.autoDispose<MyAuthorPageViewModel, MyAuthorPageModel?>((ref) {
  // Logger().d("myAuthorPage창고관리자 실행됨");
  return new MyAuthorPageViewModel(ref, null)..notifyInit();
  // return new MyAuthorPageViewModel(ref, null);
});
