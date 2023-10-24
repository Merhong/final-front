import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/data/dto/webtoon_DTO/list_page_webtoon_DTO.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/model/webtoon.dart';
import 'package:flutter_blog/data/repository/webtoon_repository.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

// 1. 창고 데이터

class WebtoonListModel {
  List<ListPageWebtoonDTO> webtoonDTOList;

  WebtoonListModel({required this.webtoonDTOList});
}

// 2. 창고
class WebtoonListViewModel extends StateNotifier<WebtoonListModel?> {
  Ref ref;

  final mContext = navigatorKey.currentContext;

  WebtoonListViewModel(this.ref, super._state); // 상태가 바뀌면 자동으로 그려짐

  // notify 구독자들에게 알려줌
  Future<void> notifyInit() async {
    ResponseDTO responseDTO = await WebtoonRepository().fetchWebtoonList("jwt임시");
    state = WebtoonListModel(webtoonDTOList: responseDTO.data);
  }
}

// 3. 창고 관리자 (View가 빌드되기 직전에 생성됨)
final webtoonListProvider = StateNotifierProvider<WebtoonListViewModel, WebtoonListModel?>((ref) {
  // Logger().d("webtoonList창고관리자 실행됨");
  return new WebtoonListViewModel(ref, null)..notifyInit();
});
