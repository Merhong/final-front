

# 네이버 웹툰 클론코딩

## 시연영상
https://www.youtube.com/watch?v=AUlqyQ6gb64

## 프로젝트 4조
* 김대홍(팀장)
* 김지원
* 김하얀
* 박민희
* 윤혜림


## 프로젝트 4조
- 김대홍(팀장)
- 김하얀
- 윤채빈
- 김지원
- 박민희

## 📌 시연 영상(유튜브 링크)

## 📚 기술 스택

### Backend
 <img src="https://img.shields.io/badge/Springboot-6DB33F?style=for-the-badge&logo=SpringBoot&logoColor=white">
 
### Frontend
<img src="https://img.shields.io/badge/flutter-02569B?style=for-the-badge&logo=Flutter&logoColor=white"> <img src="https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=HTML5&logoColor=white">

### 협업 도구
<img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=GitHub&logoColor=white"> <img src="https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=Git&logoColor=white"> <img src="https://img.shields.io/badge/Slack-4A154B?style=for-the-badge&logo=Slack&logoColor=white"> <img src="https://img.shields.io/badge/Notion-000000?style=for-the-badge&logo=Notion&logoColor=white">

### 데이터베이스
<img src="https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=MySQL&logoColor=white">

## REST Docs(API)
https://github.com/Merhong/final-back/blob/dev/images/api-docs.html


## 홈페이지

![KakaoTalk_20231013_164540378](https://github.com/Merhong/toy-front/assets/78343061/fbb6813f-84a7-42a0-811a-86e925785d12)

## 상세보기 페이지

![KakaoTalk_20231023_091908084](https://github.com/Merhong/toy-front/assets/78343061/01cf3707-c296-4eab-81f5-749e0aede679)



### 의존성

``` dependencies:
  flutter:
    sdk: flutter
  # 라이브러리 버전 문제가 발생하면 pub dev에서 최신 버전으로 업그레이드하세요
  flutter_svg: ^2.0.6
  flutter_lints: ^2.0.1
  validators: ^3.0.0
  intl: ^0.18.1
  cupertino_icons: ^1.0.2
  dio: ^5.2.0 # 서버와 통신하기 위해 필요한 라이브러리 입니다.
  flutter_riverpod: ^2.3.6 # 상태관리 Riverpod 라이브러리 입니다.
  logger: ^1.3.0 # 콘솔창에서 결과물을 쉽게 확인할 수 있도록 하는 Log 라이브러리입니다.
  flutter_secure_storage: ^8.0.0
  flutter_rating_bar: ^4.0.1 # 어플리케이션 Secure Storage를 쉽게 사용할 수 있도록 도와주는 라이브러리입니다.
  flutter_rating_stars: ^1.0.3+4
  iamport_flutter: ^0.10.0
  shared_preferences: ^2.0.8
  firebase_core: ^2.22.0
  firebase_messaging: ^14.7.4
  flutter_local_notifications: ^16.1.0
  animated_splash_screen: ^1.3.0
  url_launcher: ^6.2.1
```


## 기능 설명

웹툰, 에피소드, 작가 등 다양한 테이블과 관계를 공부하고 실습해볼 수 있는 네이버 웹툰을 클론코딩했습니다.


### 🧁 1단계 기능
- 회원가입 
- 로그인 / 로그아웃
- 웹툰 리스트(홈화면) 
- 웹툰 상세보기 
- 에피소드 보기 
- 웹툰 관심등록 
- 웹툰 별점 나타내기 
- 에피소드 별점 나타내기 
- 유저가 에피소드 별점 주기
- 에피소드 좋아요 누르기
- 랜덤작품 보러가기 
- 이전 에피소드 / 이후 에피소드 
- 에피소드에서 다른 회차 에피소드로 넘어가기
- 베댓, 전체 댓글로 나누기
- 댓글 작성, 삭제
- 댓글 좋아요, 싫어요
- 대댓글 작성, 삭제
- 대댓글 좋아요, 싫어요
- 추천완결
- MY 관심웹툰 
- MY 댓글 
- 더보기(공지사항)

### 🍰 2단계 기능
- 아이디 / 비밀번호 찾기
- 쿠키샵
- 쿠키 충전 및 결제
- 쿠키 구매내역
- 쿠키 사용내역
- 더보기(더미)
- 검색(추천완결 검색, 베스트 도전 검색, MY 검색, 전체 검색)
- 관리자 페이지(웹 페이지) - 기능 일부 완료
- 회원가입 화면  및 입력값 오류 알려주기
- MY 최근 본 웹툰
- MY 보관함
- 베스트도전 장르별에서 업데이트순/조회순/별점순/제목순 나누기
- 인기상승 탑 10
- 자동 로그인
- 아이디 저장
- 미리보기
- 유저가 읽은 웹툰 / 안 읽은 웹툰 

### 🍮 3단계
- 필터(Filter)
- 유효성검사 자동화
- OAuth
- API 문서 (Tool 제작)
- 실시간 푸시 기술

### 🧑‍💼 관리자 페이지

- 웹툰,작가,광고 등록/수정



  
## 느낀점
- 프론트 팀원끼리 화면 설계 단계에서 공통 컴포넌트로 빼야 할 위젯들을 함께 정리하고 
컨벤션을 정해야 각자의 화면을 구성할 때 일의 시간이 단축됨을 느꼈다.
- 각자 화면 구성을 할 때 수정하고 있는 부분과 보완해야 하는 부분을 노션에 적어놔야 다음날 회의에서 팀원끼리 소통이
원할해짐을 느꼈다.
- 통신을 할 때 백엔드에서 만들어 준 api문서와 잘 비교해보고 DTO를 생성해야 통신이 원할하게 되는 것을 배웠다.
- pub-dev에서 제공해주는 다양한 라이브러리를 검색해보고 사용함으로써 화면의 퀄리티가 올라가고 필요없는 로직을 짜지 않아도
된다는 것을 깨달았고 다음 프로젝트에서는 구현하고 싶은 화면의 기능이 막막하면 라이브러리를 찾아봐야겠다는 배움을 얻었다.
- 회의 할 때 백엔드 팀원이 필요한 화면이 무엇인지 정확하게 물어보고 피드백을 받아서  소통의 중요성을 깨달았다.
- stateless 위젯과 stateful 위젯 이해가 잘 되어 있어야 적절한 위젯을 사용할 수 있다는 것을 배웠다. 
- 프로젝트가 끝나더라도 코드 리팩토링을 하며 몰랐던 개념을 다시 정리해햐 하는 시간이 필요한 것 같다.

## 보완점
- 베스트도전
- 베스트도전 공모전 참가작
- 베스트 도전 장르별로 나누기
- 신고하기
- 차단하기
- 캡쳐 기능
- 캡쳐 후 겟짤 게시판 등록
- 공유하기
- 소장하기
- 임시저장
- 첫화보기

