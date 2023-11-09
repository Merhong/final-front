import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/other/see_more_page/widgets/Button.dart';
import 'package:flutter_blog/ui/pages/other/see_more_page/widgets/notice_page.dart';
import 'package:flutter_blog/ui/pages/other/see_more_page/widgets/setting_Text.dart';
import 'package:shared_preferences/shared_preferences.dart'; // 추가된 패키지

class CupertinoStyleSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  CupertinoStyleSwitch({
    required this.value,
    required this.onChanged,
  });

  @override
  _CupertinoStyleSwitchState createState() => _CupertinoStyleSwitchState();
}

class _CupertinoStyleSwitchState extends State<CupertinoStyleSwitch> {
  Future<void> saveSwitchState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('purchaseAfterView', value);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged(!widget.value);
        // 스위치 상태가 변경될 때 SharedPreferences에 저장
        saveSwitchState(widget.value);
      },
      child: Container(
        width: 60.0,
        height: 30.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: widget.value ? Colors.green : Colors.grey,
        ),
        child: Row(
          mainAxisAlignment:
              widget.value ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Container(
              width: 30.0,
              height: 30.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool languageSetting = false;
  bool notificationSetting = false;
  bool mobileDataAlert = false;
  bool purchaseAfterView = false;

  @override
  void initState() {
    super.initState();
    // 앱 시작 시 스위치 상태를 SharedPreferences에서 로드
    loadSwitchStates();
  }

  Future<void> loadSwitchStates() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      languageSetting = prefs.getBool('languageSetting') ?? false;
      notificationSetting = prefs.getBool('notificationSetting') ?? false;
      mobileDataAlert = prefs.getBool('mobileDataAlert') ?? false;
      purchaseAfterView = prefs.getBool('purchaseAfterView') ?? false;
    });
  }

  // 스위치 상태를 SharedPreferences에 저장
  Future<void> saveSwitchState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('purchaseAfterView', value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true, // 뒤로 가기 버튼 표시 여부
        iconTheme: IconThemeData(
          color: Colors.black, // 뒤로 가기 버튼 아이콘 색상을 검은색으로 설정
        ),
        centerTitle: true, // 제목 가운데 정렬
        title: Text(
          '설정',
          style: TextStyle(
            color: Colors.black, // 텍스트 컬러를 검은색으로 설정
          ),
        ),
      ),
      body: ListView(
        children: [
          SettingText(text: '부가기능'),
          Padding(
            padding: const EdgeInsets.only(
                top: 8.0, bottom: 8.0, left: 16, right: 16),
            child: Row(
              children: [Text('다크 모드 설정'), Spacer(), Text('라이트 모드 유지 >')],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(
                top: 8.0, bottom: 8.0, left: 16, right: 16),
            child: Row(
              children: [Text('동영상 자동 재생'), Spacer(), Text('항상켜기 >')],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('결제 후 작품 바로 보기'),
                CupertinoStyleSwitch(
                  value: purchaseAfterView,
                  onChanged: (value) {
                    setState(() {
                      purchaseAfterView = value;
                    });
                  },
                ),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('관심 웹툰 표시 기능 사용하기'),
                    Text(
                      '요일 별 작품리스트에서 관심 등록한 웹툰을 표시합니다.',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                CupertinoStyleSwitch(
                  value: notificationSetting,
                  onChanged: (value) {
                    setState(() {
                      notificationSetting = value;
                    });
                  },
                ),
              ],
            ),
          ),
          SettingText(text: '알림'),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('이동통신망 사용 알림'),
                CupertinoStyleSwitch(
                  value: mobileDataAlert,
                  onChanged: (value) {
                    setState(() {
                      mobileDataAlert = value;
                    });
                  },
                ),
              ],
            ),
          ),
          Divider(),
          SettingButton(
            text: '푸시알림',
            navigateToPageText: '>',
          ),
          SettingText(text: '회차 읽음 정보 관리 (로그인 ID 기준)'),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Container(
              height: 80,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('회차 읽음 정보 ID에 동기화하기'),
                        Text(
                          '(비로그인 상태로 읽은 기록도 포함)',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      // ">" 버튼을 누르면 이동할 페이지로 이동하는 로직을 추가하세요.
                    },
                    child: Text('>', style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
            ),
          ),
          SettingText(text: '댓글'),
          SettingButton(
            text: '댓글 차단 관리',
            navigateToPageText: '>',
          ),
          Divider(color: Colors.white),
          SettingText(text: '고객 도움말'),
          SettingButton(
            text: '웹툰 고객센터',
            navigateToPageText: '>',
          ),
          Divider(),
          SettingButton(
            text: '오류신고',
            navigateToPageText: '>',
          ),
          Divider(),
          SettingButton(
            text: '공지사항',
            navigateToPageText: '>',
            onPressed: () {
              // '프로그램 정보' 버튼을 눌렀을 때 NoticePage로 이동
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NoticePage()),
              );
            },
          ),
          SettingText(text: '정보'),
          SettingButton(
            text: '프로그램 정보   ',
            navigateToPageText: '>',
          ),
        ],
      ),
    );
  }
}
