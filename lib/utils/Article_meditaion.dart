import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_tales/models/models.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../providers/uri_controller.dart';

class Articles extends StatefulWidget {
  const Articles({super.key});

  @override
  State<Articles> createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  List<Articlemodel> articles = [
    Articlemodel(
        title: 'Meditate For Peace',
        subtitle: '7 min read',
        imgurl: "https://images.unsplash.com/photo-1499728603263-13726abce5fd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
                url:
            'https://www.google.com/amp/s/betterme.world/articles/meditate-for-peace/amp/'),
    Articlemodel(
        title: 'Hold Onto Our Mental Peace',
        subtitle: '10 min read',
        imgurl:
            'https://images.unsplash.com/photo-1542353436-312f0e1f67ff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cmVsaWVmfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
        url:
            'https://medium.com/spiritual-secrets/how-to-hold-onto-our-mental-peace-7b2d6071770d'),
    Articlemodel(
        title: 'How to Sleep Better',
        subtitle: '8 min read',
        imgurl:
"https://images.unsplash.com/photo-1531353826977-0941b4779a1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8c2xlZXAlMjBiZXR0ZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
    url:
            'https://www.helpguide.org/articles/sleep/getting-better-sleep.htm'),
    Articlemodel(
        title: 'Manage stress',
        subtitle: '15 min read',
        imgurl:
            'https://media.istockphoto.com/id/1139069245/photo/beautiful-young-woman-sitting-on-the-floor-with-crossed-legs-using-laptop-relax-and-smiling.jpg?s=612x612&w=0&k=20&c=xhL03f0AQJwtSZY7_qFRlMrcb6nQ_XSvFCHYCQJP4I0=',
        url:
"https://www.mentalhealth.org.uk/explore-mental-health/publications/how-manage-and-reduce-stress"  ),
  Articlemodel(
        title: 'Inner Peace',
        subtitle: '2 min read',
        imgurl:
            'https://media.istockphoto.com/id/1313456479/photo/man-and-soul-yoga-lotus-pose-meditation-on-nebula-galaxy-background.jpg?s=612x612&w=0&k=20&c=jJ0pVed-sHjDBtomrO7KmR4qtIfH8OaNhjmEsXvJmAI=',
        url:
            'https://www.innerpeacenow.com/finding-inner-peace'),
    Articlemodel(
        title: 'Self Care Tips',
        subtitle: '7 min read',
        imgurl:
            'https://media.istockphoto.com/id/1141689090/photo/meditating-close-up-female-hands-prayer.jpg?s=612x612&w=0&k=20&c=F77hEB78ClvWJk1IXHE03Kl05_xLugdZrQ0tWYupdxk=',
        url:
            'https://theblissfulmind.com/one-sentence-self-care-tips/'),
    Articlemodel(
        title: 'Benefits of Meditation',
        subtitle: '10 min read',
        imgurl:
            'https://media.istockphoto.com/id/1194095339/photo/man-meditating-at-park.jpg?s=612x612&w=0&k=20&c=AXLhil28FPSW9Bgj4_YtsCUPIVAMElLrp8OgnU9eZtk=',
        url:"https://www.healthline.com/nutrition/12-benefits-of-meditation"),
   
    Articlemodel(
        title: 'Yoga for mental health',
        subtitle: '8 min read',
        imgurl:"https://images.unsplash.com/photo-1575052814086-f385e2e2ad1b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
        url:
            'https://www.health.harvard.edu/staying-healthy/yoga-for-better-mental-health'),
    Articlemodel(
        title: 'Mental Health Exercise',
        subtitle: '10 min read',
        imgurl:"https://images.unsplash.com/photo-1528715471579-d1bcf0ba5e83?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1193&q=80",
        url:
            'https://www.helpguide.org/articles/healthy-living/the-mental-health-benefits-of-exercise.htm'),
    Articlemodel(
        title: 'How to Meditate',
        subtitle: '10 min read',
        imgurl:"https://images.unsplash.com/photo-1474291102916-622af5ff18bb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1169&q=80",
        url:
            'https://www.nytimes.com/guides/well/how-to-meditate'),
             Articlemodel(
        title: 'Peace of Mind',
        subtitle: '7 min read',
        imgurl:
            'https://media.istockphoto.com/id/1315856341/photo/young-woman-meditating-outdoors-at-park.jpg?s=612x612&w=0&k=20&c=cQjPuCiusPAQkWAp6k4c0981M9BaGkbzAKOeTOs9f2s=',
        url:
            'https://psychcentral.com/blog/how-to-achieve-peace-of-mind'),
    
  ];

  // _launchURL(String link) async {
  //   print(link);
  //   final uri = Uri.parse(link);
  //   if (await canLaunchUrl(uri)) {
  //     await launchUrl(uri);
  //   } else {
  //     throw 'Could not launch $uri';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<Launch>(
      builder: (context, value, child) {
        return SizedBox(
        height: 143.h,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: articles.length,
            itemBuilder: (context, index) {
              final articlelist = articles[index];
    
              return GestureDetector(
                onTap: (){ Provider.of<Launch>(context,listen: false).launchURL(articlelist.url);
                },
                child: Padding(
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
                ),
              );
      }
        ));    
    });
      
    
  }
}
