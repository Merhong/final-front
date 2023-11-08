import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/dto/user_dto/interest_author_DTO.dart';
import 'package:flutter_blog/data/dto/user_dto/interest_webtoon_DTO.dart';
import 'package:flutter_blog/data/dto/user_dto/my_interest_author_all_DTO.dart';
import 'package:flutter_blog/data/dto/webtoon_DTO/detail_page_webtoon_DTO.dart';
import 'package:flutter_blog/data/dto/webtoon_dto/interest_DTO.dart';
import 'package:flutter_blog/data/dto/webtoon_dto/interst_webtoon_DTO.dart';
import 'package:flutter_blog/data/provider/param_provider.dart';
import 'package:flutter_blog/data/provider/session_provider.dart';
import 'package:flutter_blog/data/repository/author_repository.dart';
import 'package:flutter_blog/data/repository/webtoon_repository.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 창고 데이터

class MyAuthorPageModel {
  // List<InterestAuthorDTO> interestAuthorDTOList;
  MyInterestAuthorAllDTO myInterestAuthorAllDTO;
  String? sortCheck;

  MyAuthorPageModel({required this.myInterestAuthorAllDTO, this.sortCheck});

  MyAuthorPageModel interestAlarmUpdate({required MyInterestAuthorAllDTO myInterestAuthorAllDTO}) {
    return MyAuthorPageModel(myInterestAuthorAllDTO: myInterestAuthorAllDTO, sortCheck: this.sortCheck);
  }

  MyAuthorPageModel sortUpdate({required String sort}) {
    return MyAuthorPageModel(myInterestAuthorAllDTO: this.myInterestAuthorAllDTO, sortCheck: sort);
  }
}

// 2. 창고
class MyAuthorPageViewModel extends StateNotifier<MyAuthorPageModel?> {
  Ref ref;
  final mContext = navigatorKey.currentContext;

  // StateNotifier<PostListModel?> 에서 PostListModel은 상태의 타입
  MyAuthorPageViewModel(this.ref, super._state); // 상태가 바뀌면 자동으로 그려짐

  // notify 구독자들에게 알려줌
  Future<void> notifyInit() async {
    SessionUser sessionUser = ref.read(sessionProvider);
    // int webtoonId = ref.read(paramProvider).webtoonDetailId!;
    ResponseDTO responseDTO = await AuthorRepository().fetchInterestAuthor(sessionUser.jwt!);
    state = MyAuthorPageModel(myInterestAuthorAllDTO: responseDTO.data);
    // state = MyAuthorPageModel();
    // state!.webtoonDTO = responseDTO.data;
  }

  Future<void> notifyMyInterestAlarm(InterestAuthorDTO paramDTO) async {
    SessionUser sessionUser = ref.read(sessionProvider);

    ResponseDTO responseDTO;
    if (paramDTO.isAlarm == true) {
      responseDTO = await AuthorRepository().fetchInterestAlarmOff(sessionUser.jwt!, paramDTO.authorId);
    } else {
      responseDTO = await AuthorRepository().fetchInterestAlarmOn(sessionUser.jwt!, paramDTO.authorId);
    }

    if (responseDTO.success == false) {
      print("if로감");
      return;
    }

    MyInterestAuthorAllDTO myInterestAuthorAllDTO = state!.myInterestAuthorAllDTO;
    List<InterestAuthorDTO> interestAuthorDTOList = myInterestAuthorAllDTO.interestAuthorDTOList;

    InterestAuthorDTO updateInterestAuthorDTO = responseDTO.data as InterestAuthorDTO;
    interestAuthorDTOList = interestAuthorDTOList.map((e) => e.id == paramDTO.id ? updateInterestAuthorDTO : e).toList();

    myInterestAuthorAllDTO.interestAuthorDTOList = interestAuthorDTOList;

    state = state!.interestAlarmUpdate(myInterestAuthorAllDTO: myInterestAuthorAllDTO);
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
