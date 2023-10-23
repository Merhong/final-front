import 'package:flutter/material.dart';

const double sizeS5 = 5.0;
const double sizeM10 = 10.0;
const double sizeL20 = 20.0;
const double sizeXL50 = 50.0;
const double sizeXXL100 = 100.0;

// 기본 좌우 패딩
const double sizePaddingLR17 = 17.0;

const double sizeBorder5 = 5.0;

const double sizeWebtoonListItemPictureHeight160 = 160.0;

// 폰 높이는 대부분 리스트뷰 쓰니까 안 중요한데 좌우는 폰마다 달라서 중요함
// 가급적 좌우 길이 직접 적는거보다 이거에 곱해서 비율로 사용
double sizeGetScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

// double getDrawerWidth(BuildContext context) {
//   return getScreenWidth(context) * 0.6;
// }
