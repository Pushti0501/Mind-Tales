import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/models.dart';
import '../providers/uri_controller.dart';

class YogaScreen extends StatefulWidget {
  const YogaScreen({super.key});

  @override
  State<YogaScreen> createState() => _YogaScreenState();
}

class _YogaScreenState extends State<YogaScreen> {
  List<YogaModel> yoga = [
    YogaModel(
        img:
            "https://i.ytimg.com/vi/7DoQMnmo0v8/hq720.jpg?sqp=-…AFwAcABBg==&rs=AOn4CLCQ8AeNqxZ4WG1Dq4zKueSM66H8rg",
        url: "https://youtu.be/7DoQMnmo0v8",
        description: "Asanas to overcome Depression"),
    YogaModel(
        img:
            "https://i.ytimg.com/vi/e1TdD5vWeSM/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLAGnGJgRpvHk8oOF0vVICnTMc075w",
        url: "https://www.youtube.com/watch?v=e1TdD5vWeSM",
        description: "5 Yoga poses to relieve stress"),
    YogaModel(
        img:
            "https://i.ytimg.com/vi/COp7BR_Dvps/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLBPSSRP3cV7wKqRv0oot5mnuMJrsw",
        url: "https://www.youtube.com/watch?v=COp7BR_Dvps",
        description: "30 Minute Relaxing Yoga For Mental Health"),
    YogaModel(
        img:
            "https://i.ytimg.com/vi/5EXGqBfrw-0/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLCQsU_J0bGLLJUqiKJLPfRUtKDKjw",
        url: "https://www.youtube.com/watch?v=5EXGqBfrw-0",
        description:
            "6 Minutes Powerful PRANAYAMA To De-Stress Before You Sleep"),
    YogaModel(
        img:
            "https://i.ytimg.com/vi/hJbRpHZr_d0/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLAXZGYIT3NRX5rRSudWnsamnrGXhg",
        url: "https://www.youtube.com/watch?v=hJbRpHZr_d0",
        description: "Yoga For Anxiety and Stress"),
    YogaModel(
        img:
            "https://i.ytimg.com/vi/uNiJW0KMwf4/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLDpp3dqceiFGrUgOT0s3KhO98i0qw",
        url: "https://www.youtube.com/watch?v=uNiJW0KMwf4",
        description: "Guided Meditation for Stress Relief, Anxiety"),
    YogaModel(
        img:
            "https://i.ytimg.com/vi/5YNKDTfDuD0/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLBRWwjW2esN6BrB7Vt2LQDbOc0Nww",
        url: "https://www.youtube.com/watch?v=5YNKDTfDuD0",
        description: "5 Exercises To Heal Your Mind"),
    YogaModel(
        img:
            "https://i.ytimg.com/vi/eqH9Dp8r14A/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLADteLjBtnRSS9jKSxW0dJE5nADjg",
        url: "https://www.youtube.com/watch?v=eqH9Dp8r14A",
        description: "Yoga for stress"),
    YogaModel(
        img:
            "https://i.ytimg.com/vi/8TuRYV71Rgo/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLBQM8aeLZYuuuLxH7KWCpoutnqEiA",
        url: "https://www.youtube.com/watch?v=8TuRYV71Rgo",
        description: "10 Minute Yoga Stress and Anxiety"),
    YogaModel(
        img:
            "https://i.ytimg.com/vi/AGkc_UEKAEM/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLC9rSeUQtgryngUg9yq6f_f09iSrw",
        url: "https://www.youtube.com/watch?v=AGkc_UEKAEM",
        description: "Pranayama Practice for Anxiety & Stress Relief"),
    YogaModel(
        img:
            "https://i.ytimg.com/vi/vLXJY68gx8w/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLDo7i3a0m8TQjTecaSPakmQFfRAkg",
        url: "https://www.youtube.com/watch?v=vLXJY68gx8w",
        description: "4 Yoga Asanas to Help You Sleep Better"),
    YogaModel(
        img:
            "https://i.ytimg.com/vi/8KDnmL4b6oY/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLCF_wa0-p8-ZOLtGRT1gXxPssLSJw",
        url: "https://www.youtube.com/watch?v=8KDnmL4b6oY",
        description: "7-Minute Yoga for Better Sleep"),
    YogaModel(
        img:
            "https://i.ytimg.com/vi/R3CtmnQD8b4/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLDYQtbJQmaH10Wtu1vsTmU4AhJGMA",
        url: "https://www.youtube.com/watch?v=R3CtmnQD8b4",
        description: "Pranayama for deep sleep, calm mind and reduce anxiety"),
    YogaModel(
        img:
            "https://i.ytimg.com/vi/G4oyMxssygA/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLCoW80hJhYpd-Sj9zSsh85rb1iB2w",
        url: "https://www.youtube.com/watch?v=G4oyMxssygA",
        description: "5 Yoga Poses to improve your mood"),
  ];
  _launchURL(String link) async {
    print(link);
    final uri = Uri.parse(link);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Launch>(
        builder: (context, value, child){
          return    Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            automaticallyImplyLeading: false,
            title: Text(
              "Yoga",
              style: GoogleFonts.inter(
                  fontSize: 20.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
          ),
          body: ListView.builder(
            itemCount: yoga.length,
            itemBuilder: (BuildContext context, int index) {
              final yoga_sessions = yoga[index];
              return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(yoga_sessions.img,
                            height: 171.h, width: 328.w, fit: BoxFit.cover),
                      ),
                      Container(
                        height: 35.h,
                        width: 328.w,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0)),
                          color: Colors.black38,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 6.5.h),
                          child: Text(
                            yoga_sessions.description,
                            style: GoogleFonts.inter(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 4.h,
                        bottom: 12.h,
                        child: InkWell(
                          onTap: () {
                            Provider.of<Launch>(context).launchURL(yoga_sessions.url);
                          },
                          child: SvgPicture.asset("images/icons/Play.svg",
                              width: 35.w, height: 35.h),
                        ),
                      ),
                    ],
                  ));
            },
          ));
        }
   
    );
  }
}
