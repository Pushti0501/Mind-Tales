import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:url_launcher/url_launcher.dart';


import '../models/models.dart';

class QuickandEasyModule extends StatefulWidget {
  const QuickandEasyModule({super.key});

  @override
  State<QuickandEasyModule> createState() => _QuickandEasyModuleState();
}

class _QuickandEasyModuleState extends State<QuickandEasyModule> {
  List<QuickandEasy> QuickandEasylist = [
    QuickandEasy(
      title: 'Good Vibe',
      subtitle: 'Healing Meditation',

      url: 'https://open.spotify.com/track/2UXZYkbYUY64hIjK1S2m1z',
    ),
    QuickandEasy(
      title: 'Lost in Thought',
      subtitle: 'Peaceful Meditation',

      url: 'https://open.spotify.com/track/1warTb25JYDzFGmudQGvBS',
    ),
    QuickandEasy(
      title: 'Quiet Morning',
      subtitle: 'Peaceful Meditation',

      url: 'https://open.spotify.com/track/381kfIJRGnutT5xDRmzVJ5',
    ),
    QuickandEasy(
      title: 'Tranquility',
      subtitle: 'Meditation',

      url: 'https://open.spotify.com/track/4Iu8dJygqsDjoGMC4EyOem',
    ),
    QuickandEasy(
      title: 'Positive Thinking',
      subtitle: 'Meditation',

      url: 'https://open.spotify.com/track/66KL79kEj6c6iOz16ub3i7',
    ),
    QuickandEasy(
      title: 'Sleeping Pills',
      subtitle: 'Meditation',

      url: 'https://open.spotify.com/album/2OYK88BHWyMKsZ0moeRDp0',
    ),
    QuickandEasy(
      title: 'Restful Mind',
      subtitle: 'Meditation',
      
      url: 'https://open.spotify.com/track/36PBzxDSXYQGd0HwQrx4vI',
    ),
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
      height: 210.h,
      child: ListView.builder(
        
          itemCount: 3,
          itemBuilder: (context, index) {
            final quickandeasy = QuickandEasylist[index];
            return Padding(
              padding: const EdgeInsets.only(left: 3, right: 3),
             child: Column(
               children: [
                 InkWell(
                  onTap: (){_launchURL(quickandeasy.url);},
                   child: ListTile(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
                    tileColor: Color(0xFFD6E5EB),
                    leading: CircleAvatar(
                      radius: 24.r,
                      backgroundImage: NetworkImage("https://deow9bq0xqvbj.cloudfront.net/dir-logo/698420/698420_300x300.jpg"),
                    ),
                    title: Text(quickandeasy.title),
                    subtitle: Text(quickandeasy.subtitle),
                   ),
                 ),
                 SizedBox(height: 5.h,)
               ],
             ),
             
            );
          }),
    );
  }
}
