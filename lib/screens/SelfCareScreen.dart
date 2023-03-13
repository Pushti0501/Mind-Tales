import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_tales/reusable.dart';
import 'package:mind_tales/screens/JournalScreen.dart';
import 'package:mind_tales/screens/YogaScreen.dart';

import 'MeditationScreen.dart';
import 'PodcastScreen.dart';

class SelfCareScreen extends StatefulWidget {
  const SelfCareScreen({super.key});

  @override
  State<SelfCareScreen> createState() => _SelfCareScreenState();
}

class _SelfCareScreenState extends State<SelfCareScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
        
        automaticallyImplyLeading: false,
        elevation: 3.0,
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.menu,
                size: 30.sp,
                color: Colors.black,
              ));
        }),
        backgroundColor: Theme.of(context).primaryColor,
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.all(14.0),
        //     child: Icon(
        //       Icons.notifications_outlined,
        //       size: 30.sp,
        //       color: Colors.black,
        //     ),
        //   ),
        // ],
      ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MeditationScreen(),
                      )),
                  child: SelfCareModules(
                      img:
                          'https://media.istockphoto.com/id/1330475368/photo/silhouette-of-a-beautiful-yoga-woman-in-the-morning-at-the-hot-spring-park.jpg?b=1&s=170667a&w=0&k=20&c=PLQEnX-zRRiJMWuaCdsGtptqrWVY9xm-Noo_XmH-ri0=',
                      title: 'Meditation')),
              GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => YogaScreen(),
                      )),
                  child: SelfCareModules(
                      img:
                          'https://images.unsplash.com/photo-1599447332412-6bc6830c815a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NzV8fHlvZ2F8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
                      title: 'Yoga')),
              GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => JournalScreen()
                      )),
                  child: SelfCareModules(
                      img:
                          'https://images.unsplash.com/photo-1517971071642-34a2d3ecc9cd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGpvdXJuYWx8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
                      title: 'Journal')),
              GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PodcastScreen(),
                      )),
                  child: SelfCareModules(
                      img:
                          'https://media.istockphoto.com/id/1330300196/photo/microphone-with-laptop-live-video-and-working-at-home-concept.jpg?b=1&s=170667a&w=0&k=20&c=iL3FrHkdkhunwz2CFwETRpExFwwDff7sprAsDuCBSvQ=',
                      title: 'Podcast')),
            ],
          ),
        ),
      ),
    );
  }
}
