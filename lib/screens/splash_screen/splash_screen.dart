import 'package:flutter/material.dart';
import 'package:movies/home_screen/home_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:movies/tempelates/app_colors.dart';
class SplashScreen extends StatefulWidget {
  static const String SplashScreenRoute='/splash';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  _navigateToLogin() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(splash:'assets/images/movies.png', nextScreen:HomeScreen(),
        backgroundColor:AppColors.backGroundColor,
        animationDuration:Duration(seconds:1),
        centered:true,
        splashIconSize:300,
        splashTransition:SplashTransition.fadeTransition,
    );
  }
}
