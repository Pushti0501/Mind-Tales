import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';


import '../models/models.dart';
class Sleepbetter extends StatefulWidget {
  const Sleepbetter({super.key});

  @override
  State<Sleepbetter> createState() => _SleepbetterState();
}

class _SleepbetterState extends State<Sleepbetter> {
  List<SleepbetterModel> sleepbetter=[
    SleepbetterModel( imgurl: 'https://i.ytimg.com/vi/fOcJCXZwW-I/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLBr7d0GA9YLw9VzsdX51J7CzfjFkw',url:"https://www.youtube.com/watch?v=fOcJCXZwW-I"),
    SleepbetterModel( imgurl: 'https://i.ytimg.com/vi/9cVLnls_XtU/hqdefault.jpg?sqp=-oaymwEcCOADEI4CSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLDE4DZRXVmOv8ELEKi7xVAkEsaNvw',url:"https://www.youtube.com/watch?v=9cVLnls_XtU"),
    SleepbetterModel( imgurl: 'https://i.ytimg.com/vi/RAhYfIWWRi0/hq720.jpg?sqp=-oaymwE2CNAFEJQDSFXyq4qpAygIARUAAIhCGAFwAcABBvABAfgB_g6AArgIigIMCAAQARg7IGIocjAP&rs=AOn4CLD3JhnBfjhfuWu7C-fds5Rrzx53Qw',url:"https://www.youtube.com/watch?v=RAhYfIWWRi0"),
    SleepbetterModel( imgurl: 'https://i.ytimg.com/vi/ztLkLKMN5L8/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLAre-u5MUInB9zHezZCgoecXAtvPw',url:"https://www.youtube.com/watch?v=ztLkLKMN5L8"),
    SleepbetterModel( imgurl: 'https://i.ytimg.com/vi/aEqlQvczMJQ/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLAzTG58EO8mS7pleXpwjEcXE9Tjzg',url:"https://www.youtube.com/watch?v=aEqlQvczMJQ"),
    SleepbetterModel( imgurl: 'https://i.ytimg.com/vi/rvaqPPjtxng/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLC3VrmT3TG7j0kVNXeJCbKJBypKCg',url:"https://www.youtube.com/watch?v=rvaqPPjtxng"),
    SleepbetterModel(imgurl: "https://i.ytimg.com/vi/GV748uuBOb0/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLDdFnkuqiAPvsdqbDCUQL_mxJ3cnQ", url: "https://www.youtube.com/watch?v=GV748uuBOb0"),
    SleepbetterModel(imgurl: "https://i.ytimg.com/vi/ZgPHetPG4MY/hqdefault.jpg?sqp=-oaymwEcCOADEI4CSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLDFJV1aRZApdGcIxOWmio5TiZ3TuQ", url: "https://www.youtube.com/watch?v=ZgPHetPG4MY"),
    SleepbetterModel(imgurl: "https://i.ytimg.com/vi/5KaVWkCuy-0/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLB9bnPkZW3gzdbSHSrVN1TNel0hKA", url: "https://www.youtube.com/watch?v=5KaVWkCuy-0"),
    SleepbetterModel(imgurl: "https://i.ytimg.com/vi/yU4LxOcY5w8/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLBqYOPQjjtdFezQ6H5Zg1Fe5Uqkww", url: "https://www.youtube.com/watch?v=yU4LxOcY5w8"),
    SleepbetterModel(imgurl: "https://i.ytimg.com/vi/2K4T9HmEhWE/hq720.jpg?sqp=-oaymwE2CNAFEJQDSFXyq4qpAygIARUAAIhCGAFwAcABBvABAfgB1AaAAuADigIMCAAQARg2IGUocjAP&rs=AOn4CLD5FvuEP1yZuKd1hUogAHa0f4uZkA", url: "https://www.youtube.com/watch?v=2K4T9HmEhWE"),
    

    
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
    return Container(
       height: 143.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: sleepbetter.length,
          itemBuilder: (context, index) {
            final sleepbetterlist = sleepbetter[index];
            
            return Padding(
              padding: const EdgeInsets.only(left:3,right:3),
              child: Stack(
                alignment: Alignment.center,
                children:[ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(sleepbetterlist.imgurl,
                      height: 147.h, width: 143.w, fit: BoxFit.fill),
                ),
                 InkWell(
                                   onTap: () {
                  _launchURL(sleepbetterlist.url);
                                   },
                                   child: SvgPicture.asset("images/icons/Play.svg",
                    width: 35.w, height: 35.h),
                                 ),
                ]
                 
              ),
            );
          }),
    );
  }
}