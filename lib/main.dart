import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/_core/firebase/api/firebase_api.dart';
import 'package:flutter_blog/_core/firebase/firebase_options.dart';
import 'package:flutter_blog/_core/firebase/services/local_notification_service.dart';
import 'package:flutter_blog/data/provider/push_move_view_model.dart';
import 'package:flutter_blog/ui/pages/auth/login_page/autor_login_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '_core/constants/theme.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> backgroundHandler(RemoteMessage message) async {
  print("앱 백그라운드일떄 : ${message.data.toString()}");
  print("앱 백그라운드일떄 : ${message.notification!.title}");
}

void main() async {
  print("main1");
  WidgetsFlutterBinding.ensureInitialized();

  print("main2");
  LocalNotificationService.initalize();

  print("main3");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  print("main4");
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);

  print("main5");
  await FirebaseApi().initNotifications();

  print("main6");
  runApp(ProviderScope(child: await MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    FirebaseMessaging.instance.getInitialMessage().then((message) {
      print("실행33");
      print("실행33${message}");
      if (message != null) {
        print("실행33 if문");

        String routeFromMessage = message.data["route"];

        print("실행33 if문 : ${routeFromMessage}");
        int messageWebtoonId = int.parse(routeFromMessage);

        print("${messageWebtoonId}");
        print("${messageWebtoonId.runtimeType}");

        ref.read(pushMoveProvider.notifier).notifyWhereMove(messageWebtoonId);
      }
    });

    // 앱 켜져있을때
    FirebaseMessaging.onMessage.listen((message) {
      print("실행44");
      if (message.notification != null) {
        print("앱 켜져있을때 : ${message.notification!.title}");

        print("앱 켜져있을때 : ${message.notification!.body}");
      }

      LocalNotificationService.display(message);

      // String routeFromMessage = message.data["route"];
      // int messageWebtoonId = int.parse(routeFromMessage);
      //
      // print("${messageWebtoonId}");
      // print("${messageWebtoonId.runtimeType}");
      //
      // ref.read(pushMoveProvider.notifier).notifyWhereMove(messageWebtoonId);
    });

    // background
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print("실행55");
      String routeFromMessage = message.data["route"];

      print("==============onMessageOpenedApp : ${routeFromMessage}");
      int messageWebtoonId = int.parse(routeFromMessage);

      print("${messageWebtoonId}");
      print("${messageWebtoonId.runtimeType}");

      ref.read(pushMoveProvider.notifier).notifyWhereMove(messageWebtoonId);

      // ParamStore paramStore = ref.read(paramProvider);
      // paramStore.addWebtoonDetailId(messageWebtoonId);
      // Navigator.push(context, MaterialPageRoute(builder: (_) => WebtoonDetailPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      // context가 없는 곳에서 context를 사용할 수 있는 방법 (몰라도 됨)
      debugShowCheckedModeBanner: false,

      // 최초 화면
      initialRoute: Move.autoLoginPage,
      // _core/move.dart 에 적어주세요

      home: AutoLoginPage(),

      routes: getRouters(),
      theme: theme(),
    );
  }
}
