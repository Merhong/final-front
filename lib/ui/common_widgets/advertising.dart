import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/_core/constants/url.dart';
import 'package:flutter_blog/data/dto/other_dto/advertising_sub_DTO.dart';
import 'package:flutter_blog/data/provider/advertising_sub_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../_core/constants/size.dart';

class Advertising extends ConsumerWidget {
  final double ADHeight;
  Advertising({this.ADHeight = 65});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String photo = "default_AD.jpg";
    String linkURL = "https://naver.com";

    try {
      List<AdvertisingSubDTO> advertisingSubDTOList = ref.read(advertisingSubProvider).advertisingSubDTOList!;

      // int nowTime = (DateTime.now().minute);
      int nowTime = (DateTime.now().second.toInt() / 10).toInt();
      int listLength = advertisingSubDTOList.length;

      int nowIndex = (nowTime % listLength);

      AdvertisingSubDTO selectSubDTO = advertisingSubDTOList[nowIndex];
      photo = selectSubDTO.photo;
      linkURL = selectSubDTO.linkURL;
    } catch (e) {
      print("오류$e");
    }

    return InkWell(
      onTap: () {
        URLLink("${linkURL}");
      },
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        child: Container(
          width: double.infinity,
          height: ADHeight,
          child: Image.network("${imageURL}${photo}", fit: BoxFit.fill),
        ),
      ),
    );
  }
}
