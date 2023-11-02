import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/data/dto/other_dto/advertising_sub_DTO.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/dto/user_request.dart';
import 'package:flutter_blog/data/model/user.dart';
import 'package:flutter_blog/data/provider/session_provider.dart';
import 'package:flutter_blog/data/repository/user_repository.dart';
import 'package:flutter_blog/data/repository/webtoon_repository.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 창고 데이터
class AdvertisingSub {
  List<AdvertisingSubDTO>? advertisingSubDTOList;

  AdvertisingSub({this.advertisingSubDTOList});

  Future<void> fetchAdvertisingSubList(String jwt) async {
    ResponseDTO responseDTO = await WebtoonRepository().fetchAdvertisingSubList(jwt);
    if (responseDTO.success == true) {
      this.advertisingSubDTOList = responseDTO.data as List<AdvertisingSubDTO>;
    } else {
      print("AdvertisingSub실패");
    }
  }
}

// 3. 창고 관리자
final advertisingSubProvider = Provider<AdvertisingSub>((ref) {
  return AdvertisingSub();
});
