import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/auth/login_page/login_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Image.asset("assets/naverrr.png"),
        ],
      ),
      nextScreen: LoginPage(),
      splashIconSize: 250,
      duration: 3000,
      splashTransition: SplashTransition.slideTransition,
    );
  }
}
