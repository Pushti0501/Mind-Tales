import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_tales/models/models.dart';
import 'package:url_launcher/url_launcher.dart';

class Articles extends StatefulWidget {
  const Articles({super.key});

  @override
  State<Articles> createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  List<Articlemodel> articles = [
    Articlemodel(
        title: 'Stress Relief',
        subtitle: 'Meditation',
        imgurl:
            'https://media.istockphoto.com/id/1396463291/photo/shot-of-a-sporty-young-woman-meditating-at-home.jpg?b=1&s=170667a&w=0&k=20&c=6JskQb7VWGa6kUcBLvtWNtqV1m3lahlaEeXYDWQY54Y=',
        url:
            'https://www.google.com/amp/s/betterme.world/articles/meditate-for-peace/amp/'),
    Articlemodel(
        title: 'Stress Relief',
        subtitle: 'Meditation',
        imgurl:
            'https://images.unsplash.com/photo-1542353436-312f0e1f67ff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cmVsaWVmfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
        url:
            'https://medium.com/spiritual-secrets/how-to-hold-onto-our-mental-peace-7b2d6071770d'),
    Articlemodel(
        title: 'Stress Relief',
        subtitle: 'Meditation',
        imgurl:
            'https://images.unsplash.com/photo-1607827447475-cc1f122d0ff7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8YW54aWV0eSUyMHJlbGllZnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
        url:
            'https://medium.com/hello-love/5-affirmations-for-mental-peace-f45261272cca'),
    Articlemodel(
        title: 'Stress Relief',
        subtitle: 'Meditation',
        imgurl:
            'https://media.istockphoto.com/id/1139069245/photo/beautiful-young-woman-sitting-on-the-floor-with-crossed-legs-using-laptop-relax-and-smiling.jpg?s=612x612&w=0&k=20&c=xhL03f0AQJwtSZY7_qFRlMrcb6nQ_XSvFCHYCQJP4I0=',
        url:
            'https://medium.com/@meetmamun/stress-damages-our-physical-condition-and-kills-our-mental-peace-and-happiness-33676beca9c0'),
    Articlemodel(
        title: 'Stress Relief',
        subtitle: 'Meditation',
        imgurl:
            'https://media.istockphoto.com/id/1313456479/photo/man-and-soul-yoga-lotus-pose-meditation-on-nebula-galaxy-background.jpg?s=612x612&w=0&k=20&c=jJ0pVed-sHjDBtomrO7KmR4qtIfH8OaNhjmEsXvJmAI=',
        url:
            'https://www.innerpeacenow.com/finding-inner-peace'),
    Articlemodel(
        title: 'Stress Relief',
        subtitle: 'Meditation',
        imgurl:
            'https://media.istockphoto.com/id/1141689090/photo/meditating-close-up-female-hands-prayer.jpg?s=612x612&w=0&k=20&c=F77hEB78ClvWJk1IXHE03Kl05_xLugdZrQ0tWYupdxk=',
        url:
            'https://theblissfulmind.com/one-sentence-self-care-tips/'),
    Articlemodel(
        title: 'Stress Relief',
        subtitle: 'Meditation',
        imgurl:
            'https://media.istockphoto.com/id/1194095339/photo/man-meditating-at-park.jpg?s=612x612&w=0&k=20&c=AXLhil28FPSW9Bgj4_YtsCUPIVAMElLrp8OgnU9eZtk=',
        url:
            'https://www.medicalnewstoday.com/articles/145855'),
    Articlemodel(
        title: 'Stress Relief',
        subtitle: 'Meditation',
        imgurl:
            'https://media.istockphoto.com/id/1315856341/photo/young-woman-meditating-outdoors-at-park.jpg?s=612x612&w=0&k=20&c=cQjPuCiusPAQkWAp6k4c0981M9BaGkbzAKOeTOs9f2s=',
        url:
            'https://psychcentral.com/blog/how-to-achieve-peace-of-mind'),
    Articlemodel(
        title: 'Stress Relief',
        subtitle: 'Meditation',
        imgurl:
            'https://media.istockphoto.com/id/1139069245/photo/beautiful-young-woman-sitting-on-the-floor-with-crossed-legs-using-laptop-relax-and-smiling.jpg?s=612x612&w=0&k=20&c=xhL03f0AQJwtSZY7_qFRlMrcb6nQ_XSvFCHYCQJP4I0=',
        url:
            'https://www.medicalnewstoday.com/articles/322396'),
    Articlemodel(
        title: 'Stress Relief',
        subtitle: 'Meditation',
        imgurl:
            'https://media.istockphoto.com/id/1139069245/photo/beautiful-young-woman-sitting-on-the-floor-with-crossed-legs-using-laptop-relax-and-smiling.jpg?s=612x612&w=0&k=20&c=xhL03f0AQJwtSZY7_qFRlMrcb6nQ_XSvFCHYCQJP4I0=',
        url:
            'https://www.healthline.com/nutrition/12-benefits-of-meditation'),
    Articlemodel(
        title: 'Stress Relief',
        subtitle: 'Meditation',
        imgurl:
            'https://media.istockphoto.com/id/1139069245/photo/beautiful-young-woman-sitting-on-the-floor-with-crossed-legs-using-laptop-relax-and-smiling.jpg?s=612x612&w=0&k=20&c=xhL03f0AQJwtSZY7_qFRlMrcb6nQ_XSvFCHYCQJP4I0=',
        url:
            'https://www.nytimes.com/guides/well/how-to-meditate'),
    Articlemodel(
        title: 'Stress Relief',
        subtitle: 'Meditation',
        imgurl:
            'https://media.istockphoto.com/id/1139069245/photo/beautiful-young-woman-sitting-on-the-floor-with-crossed-legs-using-laptop-relax-and-smiling.jpg?s=612x612&w=0&k=20&c=xhL03f0AQJwtSZY7_qFRlMrcb6nQ_XSvFCHYCQJP4I0=',
        url:
            'https://www.artofliving.org/in-en/meditation/meditation-for-you/turbulence-tranquility'),
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
      height: 143.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: articles.length,
          itemBuilder: (context, index) {
            final articlelist = articles[index];

            return Padding(
              padding: const EdgeInsets.only(left: 3, right: 3),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Image.network(articlelist.imgurl,
                        height: 147.h, width: 143.w, fit: BoxFit.cover),
                  ),
                  Container(
                    height: 46.h,
                    width: 143.w,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0)),
                      color: Colors.black38,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(articlelist.title,
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 14.0.sp,
                                  fontWeight: FontWeight.w600,
                                )),
                          ),
                          Row(
                            children: [
                              Text(articlelist.subtitle,
                                  style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 11.0.sp,
                                    fontWeight: FontWeight.w400,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
