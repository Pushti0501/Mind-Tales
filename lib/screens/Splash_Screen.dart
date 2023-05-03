import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mind_tales/screens/MoodTrackScreen.dart';
import 'package:mind_tales/screens/OnBoardingScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Future.delayed(
        Duration(seconds: 2),
        () => FirebaseAuth.instance.currentUser == null
            ? Navigator.push(context,
                MaterialPageRoute(builder: (context) => OnBoardingScreen()))
            : Navigator.push(context,
                MaterialPageRoute(builder: (context) => MoodTrackScreen())));
    // Future.delayed(
    //     const Duration(seconds: 3),

    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Image.asset(
        "images/logo.png",
        scale: 3.0,
      ),
    ));
  }
}
