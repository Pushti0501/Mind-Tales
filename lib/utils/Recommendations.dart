import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:url_launcher/url_launcher.dart';

import '../models/models.dart';

class Recommendations extends StatefulWidget {
  const Recommendations({super.key});

  @override
  State<Recommendations> createState() => _RecommendationsState();
}

class _RecommendationsState extends State<Recommendations> {

  List<RecommendationsModel> recommendations = [
    RecommendationsModel(
        title: 'Stress Relief',
        imgurl:
            'https://images.unsplash.com/photo-1602192509154-0b900ee1f851?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
        subtitle: 'Meditation',
        url: 'https://youtu.be/w4tlGeSrcNw'),
          RecommendationsModel(
        title: 'Acceptance',
        imgurl:
            'https://cdn.pixabay.com/photo/2021/02/16/21/48/woman-6022486_960_720.jpg',
        subtitle: 'Podcast',
        url: 'https://open.spotify.com/episode/66srwGKH7RFxcgchfUSRCd'),
    
    RecommendationsModel(
        title: 'Mindfulness',
        imgurl:
            'https://cdn.pixabay.com/photo/2016/05/10/21/50/meditation-1384758_960_720.jpg',
        subtitle: 'Meditaion',
        url: 'https://youtu.be/6p_yaNFSYao'),
        RecommendationsModel(
        title: 'Talk to Yourself',
        imgurl:
            'https://i.pinimg.com/564x/2b/35/85/2b358571ece7214cbf738a1aabd3158e.jpg',
        subtitle: 'Podcast',
        url:'https://open.spotify.com/episode/7zLHS9cwcaAaY2B1Li08gZ'),
  
    RecommendationsModel(
        title: 'Comfort',
        imgurl:
            'https://cdn.pixabay.com/photo/2016/11/03/13/42/meditation-1794292_960_720.jpg',
        subtitle: 'Meditation',
        url:"https://youtu.be/CIaB9_1XNJc"),
    RecommendationsModel(
        title: 'Be Good',
        imgurl:
            'https://wallpapers.com/images/hd/wallpaper-words-inscription-good-wall-stripes-rer21roa4dlxsc3a.webp',
        subtitle: 'Podcast',
        url:"https://open.spotify.com/episode/4k573c4bUWnTHVy17HJ5xv"),
    RecommendationsModel(
        title: 'Feel good',
        imgurl:
            'https://cdn.pixabay.com/photo/2020/07/07/13/52/woman-5380651_960_720.jpg',
        subtitle: 'Meditation',
        url:"https://youtu.be/7HQq88o1_ms"),
    RecommendationsModel(
        title: 'Find Positivity',
        imgurl:
            'https://cdn.pixabay.com/photo/2017/11/26/15/16/smiley-2979107_960_720.jpg',
        subtitle: 'Podcast',
        url:"https://open.spotify.com/episode/48wIVwoun1ibzK6izg6ZeT"),
 
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
    return SizedBox(
      height: 147.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: recommendations.length,
          itemBuilder: (context, index) {
            final recommendation = recommendations[index];
            return Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(recommendation.imgurl,
                      height: 147.h, width: 143.w, fit: BoxFit.cover),
                ),
                Container(
                  margin: EdgeInsets.only(right:5,left: 5),
                  height: 47.h,
                  width: 143.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0),bottomRight:Radius.circular(10.0)),
                    color: Colors.black38,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Align(
                                child: Text(recommendation.title,
                                                         
                                    style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontSize: 14.0.sp,
                                      fontWeight: FontWeight.w600,
                                    )),
                              ),
                            ),
                            Row(
                              children: [
                                Text(recommendation.subtitle,
                                    style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontSize: 11.0.sp,
                                      fontWeight: FontWeight.w400
                                    )),
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                      InkWell(
                        onTap: (()async {
                          _launchURL(recommendation.url);
                          
      
        
                        }),
                        child: SvgPicture.asset("images/icons/Play.svg",width:20.w,height:20.h)),
              
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
