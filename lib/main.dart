import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mind_tales/providers/uri_controller.dart';
import 'package:mind_tales/screens/Splash_Screen.dart';
//import 'dart:ui';

import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MindTales());
}

class MindTales extends StatefulWidget {
  const MindTales({super.key});

  @override
  State<MindTales> createState() => _MindTalesState();
}

class _MindTalesState extends State<MindTales> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MultiProvider(
          providers:[
            ChangeNotifierProvider(create:(context)=>Launch())
          ],
          child: MaterialApp(
            theme: ThemeData(
              brightness: Brightness.light,
              primaryColor: const Color(0xFFEDF3F5),
              primaryColorDark: const Color(0xFF3F7C88),
            ),
            home:const SplashScreen(),
            // home: StreamBuilder(
            //   stream: FirebaseAuth.instance.authStateChanges(),
            //   builder: (context, usersnapshot) {
            //     if (usersnapshot.hasData) {
            //       return MoodTrackScreen();
            //     } else {
            //       return const OnBoardingScreen();
            //     }
            //   },
            // ),
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}
