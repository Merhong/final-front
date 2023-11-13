import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('타이틀 : ${message.notification?.title}');
  print('바디 : ${message.notification?.body}');
  print('페이로드 : ${message.data}');
}

String myTokenFCM = "none";

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print('토큰 : $fCMToken');
    myTokenFCM = fCMToken!;
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
}
