import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:my_project/loginPage.dart';
import 'package:my_project/mainMenu.dart';
import 'package:my_project/mapPage.dart';
import 'package:page_transition/page_transition.dart';

class splashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
          child: Column(children: [
        Image.asset('assets/Logo.png'),
      ])),
      // nextScreen: loginPage(),
      nextScreen: mainMenu(),
      splashIconSize: 295,
      duration: 3500,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.leftToRightWithFade,
      animationDuration: const Duration(seconds: 1),
    );
  }
}
